package utils;

public final class StringUtils {

    public static final String EMPTY_STR = "";

    private StringUtils() {
    }

    public static boolean isEmpty(String str) {
        if (str != null) {
            return EMPTY_STR.equals(str);
        }

        return true;
    }

    public static boolean isNotEmpty(String str) {
        return !isEmpty(str);
    }
}

