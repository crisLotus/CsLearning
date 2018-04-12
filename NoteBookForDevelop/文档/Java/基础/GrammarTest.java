package org.exfly.javaG;

import org.junit.Test;
import org.junit.Assert;

import java.io.*;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.Charset;
import java.nio.file.*;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.*;

public class GrammarTest {
    @Test
    public void testPlusPlus(){
        short si = 10;
        si += 10.0;
        int i = 0;
        System.out.println(i);
    }

    @Test
    public void testIf() {
        if (true) {
            Assert.assertEquals(true, true);
        }
    }

    @Test
    public void testWhile(){
        do {
            System.out.println("test");
        }while (false);
    }

    @Test
    public void testFor() {
        for (;true;) {
            Assert.assertEquals(true, true);
            break;
        }
    }

    @Test
    public void testSwitch() {
        String t = new String("aa");
        switch (t) {
            case "aa":
                System.out.println("aaaa");
                break;
            case "ab":
                System.out.println("aaaa");
                break;
            default:
                System.out.println("default");
        }
    }

    @Test
    public void testFinal(){
        FinalTestClass ft1 = new FinalTestClass();
        FinalTestClass ft2 = new FinalTestClass();
        Assert.assertEquals(ft1.test, ft2.test);
    }

    @Test
    public void testEnum() {
        FreshJuice juice = new FreshJuice();
        juice.size = FreshJuice. FreshJuiceSize.MEDUIM ;
        Assert.assertEquals(juice.size, FreshJuice. FreshJuiceSize.MEDUIM );
    }

    @Test
    public void testClassProperty(){

        ClassProperty cp = new ClassProperty();
        ClassProperty cp2 = new ClassProperty();
        cp2.i = 20;
        Assert.assertNotEquals(cp2.i, cp.i);
    }

    @Test
    public void testStatic() {
        new StaticTest();
    }

    @Test
    public void testString() {
        System.out.println(
            "abcdefghijklmnopqrstuvwxyz".substring(0, 1)
        );
    }
    @Test
    public void testLangClass(){
        Assert.assertTrue(
            new GrammarTest().getClass() instanceof java.lang.Class
        );
    }
    @Test
    public void testPring(){
        System.out.format("First name: %s, Last name: %s", "first", "last");
    }
    @Test
    public void testNumberFormat(){
        int i = Integer.parseInt("10");
        Assert.assertEquals(10, i);

        NumberFormat nf = NumberFormat.getInstance(Locale.CHINA);
        Assert.assertEquals("1,234,567,890", nf.format(1234567890));
    }

    @Test
    public void testCalendar(){
        Calendar.Builder builder =new Calendar.Builder();
        Calendar calendar1 = builder.build();
        Date date = calendar1.getTime();

        Assert.assertEquals(date.toString(), "Thu Jan 01 00:00:00 CST 1970");

        Assert.assertEquals(calendar1.get(Calendar.YEAR), 1970);
        Assert.assertEquals(calendar1.get(Calendar.MONTH), 0);

        Date dNow = new Date();
        SimpleDateFormat ft = new SimpleDateFormat("E yyy.MM.dd 'at' hh:mm:ss a zzz");
        System.out.println(ft.format(dNow));

    }

    @Test
    public void testFileOrDir(){
        FileSystem fs = FileSystems.getDefault();
        Assert.assertEquals("sun.nio.fs.WindowsFileSystem", fs.getClass().getName());
        Assert.assertEquals("\\", fs.getSeparator());

        Path source = Paths.get("D:/Project/EclipseWS4/JavaLearn//src/test/resources/file.md");
        Path target = Paths.get("D:/Project/EclipseWS4/JavaLearn/src/test/resources/io_test.md");
        try{
            Files.copy(source, target, StandardCopyOption.REPLACE_EXISTING);
        }catch (IOException e){
            e.printStackTrace();
        }
        Path tmp = Paths.get("D:\\Project\\EclipseWS4\\JavaLearn\\src\\test\\resources\\create.md");
        try {
            Files.createFile(tmp);
        } catch (IOException e) {
            e.printStackTrace();
        }

        try {
            Files.delete(target);
            Files.delete(tmp);
        }catch (IOException e){
            e.printStackTrace();
        }

        Charset charset = Charset.forName("UTF-8");
        Assert.assertEquals("UTF-8", charset.toString());
        String line1 = "Easy read and write";
        String line2 = "with java.nio.file.Files";
        Path textFiles = Paths.get("D:/Project/EclipseWS4/JavaLearn//src/test/resources/test.md");
        List<String> lines = Arrays.asList(line1, line2);
        try {
            Files.write(textFiles, lines, charset);
        } catch (IOException e) {
            e.printStackTrace();
        }

        List<String> linesRead = null;
        try {
            linesRead = Files.readAllLines(textFiles);
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (linesRead != null) {
            for(String line: linesRead){
                System.out.println(line);
            }
        }
    }

    @Test
    public void testBitReadStream(){
        Path createFile = Paths.get("D:\\Project\\EclipseWS4\\JavaLearn\\src\\test\\resources\\file.md");
        try(InputStream inputStream=Files.newInputStream(createFile, StandardOpenOption.READ);
            BufferedInputStream bi = new BufferedInputStream(inputStream)
        ){
            int i = bi.read();
            System.out.println(i);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testBitWriteStream(){
        Path createFile = Paths.get("D:\\Project\\EclipseWS4\\JavaLearn\\src\\test\\resources\\testWriteBit.md");
        Path createFile1 = Paths.get("D:\\Project\\EclipseWS4\\JavaLearn\\src\\test\\resources\\file.md");
        try (OutputStream os = Files.newOutputStream(createFile, StandardOpenOption.CREATE, StandardOpenOption.APPEND);
             InputStream is1 = Files.newInputStream(createFile1, StandardOpenOption.READ);
            BufferedOutputStream bo = new BufferedOutputStream(os);
            BufferedInputStream bi = new BufferedInputStream(is1);
        ){
            byte[] readData = new byte[1024];
            int i = is1.read(readData);
            while(i!=-1){
                os.write(readData, 0, i);
                i = is1.read(readData);
            }
        }catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testCharWriteStream(){
        char[] chars = new char[2];
        chars[0] = '\u4f60';
        chars[1] = '\u597d';
        Path path = Paths.get("D:\\Project\\EclipseWS4\\JavaLearn\\src\\test\\resources\\testWriteChar.md");
        Charset utf8Charset = Charset.forName("UTF-8");

        try(OutputStream outps = Files.newOutputStream(path, StandardOpenOption.CREATE);
            OutputStreamWriter writer = new OutputStreamWriter(outps, utf8Charset);

            InputStream inps = Files.newInputStream(path, StandardOpenOption.READ);
            InputStreamReader reader = new InputStreamReader(inps)
        ){
            writer.write(chars);

            char [] buf = new char[2];
            reader.read(buf, 0, 2);
            System.out.println(new String(buf));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @Test
    public void testStaticInerClass() {
        Outer1.InerClass c = new Outer1.InerClass();
        Assert.assertEquals(0, c.cal());
    }

    @Test
    public void testExtends(){
        Assert.assertEquals(People.t(), 2);
        Assert.assertEquals(1, Animal.t());
        Assert.assertEquals(1, Dog.t());
    }

    @Test
    public void testAnnotation(){
        Annotation[] tAnno = System.class.getAnnotations();
        for(Annotation t: tAnno){
            System.out.println(t);
        }
    }
    @Test
    public void testReflection(){
        Class<?> c = null;
        try {
            c = Class.forName("java.lang.String");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Method mthod[] = c.getDeclaredMethods();
        for (Method m: mthod){
            System.out.println(m.toString());
        }
    }

    @Test
    public void testNet(){
        URL url=null;
        try {
            url = new URL("http://example.org/");
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
        try {
            InputStream  inputStream = url.openStream();
            BufferedReader br = new BufferedReader(new InputStreamReader(inputStream));
            String line = br.readLine();
            while (line!=null) {
                System.out.println(line);
                line = br.readLine();
            }
            br.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @Test
    public void testServlet(){
    }
}

class Animal{
    public static final int i = 10;
    public static int t(){
        System.out.println("Animal.t()");
        return 1;
    }
}
class People extends Animal {
    public static int t(){
        System.out.println("People.t()");
        return 2;
    }
}
class Dog extends Animal {

}
class Outer1{
    private static int value = 0;
    static class InerClass {
        int cal() {
            return value;
        }
    }
}
class FinalTestClass {
    public static final int test=10;
}
class FreshJuice {
    enum FreshJuiceSize{ SMALL, MEDUIM, LARGE }
    FreshJuiceSize size;
}

class ClassProperty {
    public int i = 10;
}

class StaticTest{
    public static int i;
    static {
        i = 20;
        System.out.println(new java.util.Date());
    }
}

interface Testi{
    int i = 10;
    void test();
}