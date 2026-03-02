package com.example;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class BasicTest {

	@Test
	public void testBasicArithmetic() {
		// Smoke test: 2 + 2 should equal 4
		assertEquals(4, 2 + 2, "Basic arithmetic should work");
	}
}
