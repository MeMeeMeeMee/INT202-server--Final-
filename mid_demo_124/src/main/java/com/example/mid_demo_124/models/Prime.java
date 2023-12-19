package com.example.mid_demo_124.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor


public class Prime {
    private int number;
    private String message;
    private boolean isPrime;

    public Prime(int number, String message) {
        this.number = number;
        this.message = message;
        // Calculate isPrime here or set it based on the logic used in checkPrime method
        this.isPrime = checkPrime(number);
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isPrime() {
        return isPrime;
    }

    private boolean checkPrime(int number) {
        if (number <= 1) {
            return false;
        }
        for (int i = 2; i <= Math.sqrt(number); i++) {
            if (number % i == 0) {
                return false;
            }
        }
        return true;
    }
}


