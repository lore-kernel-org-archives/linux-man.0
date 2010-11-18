From: Ivana Hutarova Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: awk.1p, man.1p, printf.1p: groff syntax typos
Date: Thu, 18 Nov 2010 14:19:21 +0100
Message-ID: <4CE527D9.6050902@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000803070709080909090008"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------000803070709080909090008
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,
in posix man-pages (man-pages-posix-2003-a.tar.bz2) there are several 
problems which cause groff syntax errors. The patches which fix them are 
attached.
Ivana Hutarova Varekova



--------------000803070709080909090008
Content-Type: text/x-patch;
 name="man-pages-posix-2003-awk.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="man-pages-posix-2003-awk.patch"

diff -up man-pages-3.29/man1p/awk.1p.qqq man-pages-3.29/man1p/awk.1p
--- man-pages-3.29/man1p/awk.1p.qqq	2008-06-05 11:22:12.000000000 +0200
+++ man-pages-3.29/man1p/awk.1p	2010-10-22 15:45:44.000000000 +0200
@@ -2197,7 +2197,7 @@ necessary to use parentheses to enforce 
 .LP
 The \fIawk\fP program specified in the command line is most easily
 specified within single-quotes (for example,
-'\fIprogram\fP') for applications using \fIsh\fP, because \fIawk\fP
+\fI'program'\fP) for applications using \fIsh\fP, because \fIawk\fP
 programs commonly contain
 characters that are special to the shell, including double-quotes.
 In the cases where an \fIawk\fP program contains single-quote
diff -up man-pages-3.29/man1p/.qqq man-pages-3.29/man1p/

--------------000803070709080909090008
Content-Type: text/x-patch;
 name="man-pages-posix-2003-man.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="man-pages-posix-2003-man.patch"

diff -up man-pages-3.29/man1p/man.1p.pom man-pages-3.29/man1p/man.1p
--- man-pages-3.29/man1p/man.1p.pom	2008-06-05 11:22:12.000000000 +0200
+++ man-pages-3.29/man1p/man.1p	2010-10-22 13:35:55.000000000 +0200
@@ -44,10 +44,7 @@ command: 
 .RS
 .nf
 
-\fBgrep -Ei '
-\fP\fIname
-name\fP\fB...
-'\fP \fIsummary-database\fP
+\fBgrep -Ei '\fP\fIname name\fP\fB...' \fP \fIsummary-database\fP
 .fi
 .RE
 .LP


--------------000803070709080909090008
Content-Type: text/x-patch;
 name="man-pages-posix-2003-printf.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="man-pages-posix-2003-printf.patch"

diff -up man-pages-3.29/man1p/printf.1p.ppp man-pages-3.29/man1p/printf.1p
--- man-pages-3.29/man1p/printf.1p.ppp	2008-06-05 11:22:12.000000000 +0200
+++ man-pages-3.29/man1p/printf.1p	2010-10-22 15:33:14.000000000 +0200
@@ -144,7 +144,8 @@ octal number that shall be converted to 
 numeric value specified by the octal number
 .LP
 .IP " *" 3
-\fB'\\c'\fP, which shall not be written and shall cause \fIprintf\fP
+sequence \fB'\\c'\fP
+which shall not be written and shall cause \fIprintf\fP
 to ignore any remaining characters in the string
 operand containing it, any remaining string operands, and any additional
 characters in the \fIformat\fP operand

--------------000803070709080909090008--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
