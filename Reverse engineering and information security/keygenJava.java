package siendev.corp.apps;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Objects;

/**
 * Not fihished yet. There is a small problem with bitwise AND
 * serialNumber & SECRET_NUMBER -> line 37
 */
public class keygen {

    private static final long SECRET_NUMBER = 0x0fffffffL;

    public static void main(String[] args) throws IOException {
        String userName = inputUserName();
        if (Objects.isNull(userName) || userName.isEmpty()) {
            System.out.println("Please, enter the user name to proceed ...");
            inputUserName();
        }
        System.out.println(calculateSerialNumber(userName));
    }

    private static String inputUserName() throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
        System.out.println("Enter user name: ");
        return bufferedReader.readLine();
    }

    private static long calculateSerialNumber(String userName) {
        long serialNumber = 1;
        char[] arrayOfLetters = userName.toCharArray();

        for (char letter: arrayOfLetters) {
            serialNumber *= Character.getNumericValue(letter);
        }
        return (serialNumber & SECRET_NUMBER);
    }
}
