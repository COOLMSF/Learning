public class HelloJNI {  // Save as HelloJNI.java
   static {
      System.loadLibrary("hello"); // Load native library hello.dll (Windows) or libhello.so (Unixes)
                                   //  at runtime
                                   // This library contains a native method called sayHello()
   }
 
   // Declare an instance native method sayHello() which receives no parameter and returns void
   private native void sayHello(int b, int a);
 
   // Test Driver
   public static void main(String[] args) {
      new HelloJNI().sayHello(12, 2);  // Create an instance and invoke the native method
   }
}
