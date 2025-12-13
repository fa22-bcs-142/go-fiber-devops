package utils

import (
	"app/src/redis"
	"context"
	"encoding/json"
	"time"
)

// CacheSet stores data in Redis with expiration
func CacheSet(ctx context.Context, key string, value interface{}, expiration time.Duration) error {
	if redis.Client == nil {
		return nil // Silently skip if Redis not available
	}

	data, err := json.Marshal(value)
	if err != nil {
		return err
	}
	return redis.Client.Set(ctx, key, data, expiration).Err()
}

// CacheGet retrieves data from Redis
func CacheGet(ctx context.Context, key string, dest interface{}) error {
	if redis.Client == nil {
		return nil // Silently skip if Redis not available
	}

	val, err := redis.Client.Get(ctx, key).Result()
	if err != nil {
		return err
	}
	return json.Unmarshal([]byte(val), dest)
}

// CacheDelete removes a key from Redis
func CacheDelete(ctx context.Context, key string) error {
	if redis.Client == nil {
		return nil // Silently skip if Redis not available
	}

	return redis.Client.Del(ctx, key).Err()
}

// CacheExists checks if a key exists in Redis
func CacheExists(ctx context.Context, key string) (bool, error) {
	if redis.Client == nil {
		return false, nil
	}

	count, err := redis.Client.Exists(ctx, key).Result()
	return count > 0, err
}

// CacheSetWithPrefix sets cache with a prefix
func CacheSetWithPrefix(ctx context.Context, prefix, key string, value interface{}, expiration time.Duration) error {
	fullKey := prefix + ":" + key
	return CacheSet(ctx, fullKey, value, expiration)
}

// CacheGetWithPrefix gets cache with a prefix
func CacheGetWithPrefix(ctx context.Context, prefix, key string, dest interface{}) error {
	fullKey := prefix + ":" + key
	return CacheGet(ctx, fullKey, dest)
}

// CacheFlushAll removes all keys from Redis (use with caution)
func CacheFlushAll(ctx context.Context) error {
	if redis.Client == nil {
		return nil
	}

	return redis.Client.FlushAll(ctx).Err()
}
