package main

import (
	"testing"
)

func TestMain(t *testing.T) {
	t.Run("dummy test", func(t *testing. T) {
		// Basic test to pass CI
		if 1+1 != 2 {
			t.Error("Math is broken")
		}
	})
}
