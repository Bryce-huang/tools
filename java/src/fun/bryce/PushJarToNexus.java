package fun.bryce;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;
import java.util.List;

/**
 * @author bryce
 * 2019/10/10 11:26
 */
public class PushJarToNexus
{
    static List<String> commands = new ArrayList<>(3000);
    static String URL = "bryce-huang.club";
    static String REPOSITORY_ID = "bryce";

    public static void main(String[] args) throws IOException
    {
        Files.walkFileTree(Paths.get("C:\\Users\\cherb\\.m2\\repository"), new SimpleFileVisitor<Path>()
        {
            @Override
            public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException
            {
                if (!file.getFileName()
                        .toString()
                        .endsWith("sources.jar"))
                {
                    if (file.getFileName()
                            .toString()
                            .endsWith(".jar"))
                    {
                        String absolutePath = file.toAbsolutePath()
                                .toString();
                        String[] split = absolutePath.split("\\\\");
                        int length = split.length;
                        String aircraft = split[length - 3];
                        String group = absolutePath.substring(32)
                                .split("\\\\" + aircraft + "\\\\" + split[length - 2])[0].replace("\\", ".");
                        String version = split[length - 2];
                        String pomPath = absolutePath.replace(".jar", ".pom");
                        String command = "mvn deploy:deploy-file -DgroupId=%s -DartifactId=%s -Dversion=%s -Dpackaging=jar -Dfile=%s -Durl=%s -DrepositoryId=%s -DgeneratePom=true -Dpomfile=%s";
                        String format = String.format(command, group, aircraft, version, absolutePath, URL, REPOSITORY_ID, pomPath);
                        commands.add(format);
                    }
                }
                return super.visitFile(file, attrs);
            }

            @Override
            public FileVisitResult postVisitDirectory(Path dir, IOException exc) throws IOException
            {
                return super.postVisitDirectory(dir, exc);
            }

        });
        String path = "c:\\commands.txt";
        File file = new File(path);
        if (!file.isFile())
        {
            file.createNewFile();
        }
        BufferedWriter writer = new BufferedWriter(new FileWriter(path));
        for (String command : commands)
        {
            writer.write(command + "\r\n");
        }
        writer.close();
    }
}
