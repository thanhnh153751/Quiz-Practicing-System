/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Properties;
import java.util.stream.Stream;

/**
 *
 * @author hongd
 */
public class ReadFileUtil {

    public static String getDirPath() {
        return System.getProperty("user.dir");
    }

    public static String readFileToString(String path) {
        StringBuilder bs = new StringBuilder();
        try (
                Stream<String> stream = Files.lines(Paths.get(path), StandardCharsets.UTF_8)) {
            stream.forEach(s -> bs.append(s).append("\n"));
        } catch (IOException e) {
            System.out.println("[ReadFileUtil]: " + e);
        }
        return bs.toString();
    }

    
}
