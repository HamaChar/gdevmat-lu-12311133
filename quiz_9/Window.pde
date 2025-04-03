public static class Window
{
     public static int widthPx = 1280;
      public static int heightPx = 720;
      public static int WindowWidth = widthPx / 2;
      public static int WindowHeight = heightPx / 2;
      public static int top = WindowHeight;
      public static int bottom = -WindowHeight;
      public static int left = -WindowWidth;
      public static int right = WindowWidth; 
      public static float eyeZ = -(heightPx/2.0) / tan(PI*30.0 / 180.0);
}
