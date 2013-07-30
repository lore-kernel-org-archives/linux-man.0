From: Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] italic formatting fix in argz_add.3
Date: Wed, 31 Jul 2013 05:20:34 +0900
Message-ID: <CALhU9tk_vuKDR+syrjVUFWbG7W3t5FjiwD2kDScQMdJhkW_SBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

There are several inappropriate italic formatting in argz_add.3.

diff --git a/manual/LDP_man-pages/original/man3/argz_add.3
b/manual/LDP_man-pages/original/man3/argz_add.3
index 9032cf1..666999e 100644
--- a/manual/LDP_man-pages/original/man3/argz_add.3
+++ b/manual/LDP_man-pages/original/man3/argz_add.3
@@ -85,9 +85,9 @@ delimiter \(aq:\(aq.
 .LP
 .BR argz_append ()
 appends the argz vector
-.RI ( buf ,\ buf_len )
+.RI ( buf ", " buf_len )
 after
-.RI ( *argz ,\ *argz_len )
+.RI ( *argz ", " *argz_len )
 and updates
 .IR *argz
 and
@@ -100,7 +100,7 @@ will be increased by
 .BR argz_count ()
 counts the number of strings, that is,
 the number of null bytes (\(aq\\0\(aq), in
-.RI ( argz ,\ argz_len ).
+.RI ( argz ", " argz_len ).
 .LP
 .BR argz_create ()
 converts a UNIX-style argument vector
@@ -108,13 +108,13 @@ converts a UNIX-style argument vector
 terminated by
 .IR "(char\ *)\ 0" ,
 into an argz vector
-.RI ( *argz ,\ *argz_len ).
+.RI ( *argz ", " *argz_len ).
 .LP
 .BR argz_create_sep ()
 converts the null-terminated string
 .I str
 into an argz vector
-.RI ( *argz ,\ *argz_len )
+.RI ( *argz ", " *argz_len )
 by breaking it up at every occurrence of the separator
 .IR sep .
 .LP
@@ -122,7 +122,7 @@ by breaking it up at every occurrence of the separator
 removes the substring pointed to by
 .I entry
 from the argz vector
-.RI ( *argz ,\ *argz_len )
+.RI ( *argz ", " *argz_len )
 and updates
 .I *argz
 and
@@ -132,7 +132,7 @@ and
 is the opposite of
 .BR argz_create ().
 It takes the argz vector
-.RI ( argz ,\ argz_len )
+.RI ( argz ", " argz_len )
 and fills the array starting at
 .I argv
 with pointers to the substrings, and a final NULL,
@@ -151,7 +151,7 @@ It inserts the argument
 at position
 .I before
 into the argz vector
-.RI ( *argz ,\ *argz_len )
+.RI ( *argz ", " *argz_len )
 and updates
 .I *argz
 and

-- 
Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
