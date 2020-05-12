package fun.bryce;

import java.io.*;
import java.nio.file.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * @author bryce
 * 2020/5/6 15:13
 */
public class CpFile2LastDir
{
    static List<String> dirs = new ArrayList<>(50);
    static String ROOT = "C:\\Users\\cherb\\Desktop\\dir";
    static String FILE = "C:\\Users\\cherb\\Desktop\\dockerfile";

    public static void main(String[] args) throws IOException
    {
        Files.walkFileTree(Paths.get(ROOT), new SimpleFileVisitor<Path>()
        {

            @Override
            public FileVisitResult postVisitDirectory(Path dir, IOException exc) throws IOException
            {
                File file = dir.toFile();
                File[] files = file.listFiles();
                // 简易做法，最后一个没有文件的目录会被收录
                if (files == null || files.length == 0)
                {
                    dirs.add(file.getAbsolutePath());
                }
                return super.postVisitDirectory(dir, exc);
            }

        });
        // 传统做法，保证最后一个目录都可以被访问
//        List<String> repeats = new ArrayList<>(dirs.size() / 2);
//        for (int i = 1; i < dirs.size(); i++)
//        {
//            if (dirs.get(i - 1)
//                    .contains(dirs.get(i)))
//            {
//                repeats.add(dirs.get(i));
//            }
//        }
//        dirs.removeAll(repeats);
        File file = new File(FILE);
        for (String dir : dirs)
        {
            copy(file, new File(dir));
        }


    }

    public static void copy(File orig, File dest)
    { // 用于改后缀后复制
        BufferedReader buf = null;
        PrintWriter out = null;

        try
        {
            buf = new BufferedReader(new InputStreamReader(new FileInputStream(orig))); // 读取流，提示阅读效率
            out = new PrintWriter(dest + "\\" + orig.getName()); // 把后缀改成.java，用Print流提升效率
        } catch (IOException e)
        {
            System.out.println("文件orig或者dest异常");
        }
        String line;
        try
        {
            while ((line = Objects.requireNonNull(buf)
                    .readLine()) != null)
            {
                Objects.requireNonNull(out)
                        .println(line);
            }

        } catch (IOException ignored)
        {

        } finally
        {
            try
            {
                if (buf != null)
                {
                    buf.close();
                }
                if (out != null)
                {
                    out.close();
                }
            } catch (Exception ignored)
            {

            }
        }
    }

}