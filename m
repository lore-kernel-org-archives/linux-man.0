From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 42042] strchr(3) and memchr(3) should explain behaviour when
 character 'c' is '\0'.
Date: Mon, 23 Apr 2012 20:32:32 GMT
Message-ID: <201204232032.q3NKWWW5000542@bugzilla.kernel.org>
References: <bug-42042-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-42042-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=42042


Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org




--- Comment #6 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2012-04-23 20:32:31 ---
James,

Thanks for the detailed report, and sorry I've been slow to respond.

For strchr(3), I applied a variation of what you proposed:

--- a/man3/strchr.3
+++ b/man3/strchr.3
@@ -28,7 +28,7 @@
 .\" 2006-05-19, Justin Pryzby <pryzbyj-4haIdLZGnXT/8jPEf8fH3w@public.gmane.org>
 .\"    Document strchrnul(3).
 .\"
-.TH STRCHR 3  2010-09-20 "GNU" "Linux Programmer's Manual"
+.TH STRCHR 3  2012-04-24 "GNU" "Linux Programmer's Manual"
 .SH NAME
 strchr, strrchr, strchrnul \- locate character in string
 .SH SYNOPSIS
@@ -72,6 +72,11 @@ and
 .BR strrchr ()
 functions return a pointer to
 the matched character or NULL if the character is not found.
+The terminating null byte is considered part of the string,
+so that if
+.I c
+is specified as \(aq\\0\(aq,
+these functions return a pointer to the terminator.

 The
 .BR strchrnul ()

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
