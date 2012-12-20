From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 51811] POSIX now guarantees proper permissions for mkstemp
Date: Thu, 20 Dec 2012 15:25:15 +0000 (UTC)
Message-ID: <20121220152515.7408611FE9A@bugzilla.kernel.org>
References: <bug-51811-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-51811-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=51811


Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         Resolution|                            |CODE_FIX




--- Comment #2 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2012-12-20 15:25:15 ---
Thanks for the report, but man-pages tends to have a long memory. Some (few)
people will care about this behavior. The POSIX info dates only from 2008.
POSIX.1-2001 did not specify that detail.

All of that said, the info about old glibc could be deemphasized a little,
since it is so old now. So. I've moved it to notes, and added a note about
POSIX.1-2008. See the patch below:


--- a/man3/mkstemp.3
+++ b/man3/mkstemp.3
@@ -89,8 +89,6 @@ must not be a string constant, but should be declared as a
character array.

 The file is created with
 permissions 0600, that is, read plus write for owner only.
-(In glibc versions 2.06 and earlier, the file is created with permissions
0666,
-that is, read and write for all users.)
 The returned file descriptor provides both read and write access to the file.
 The file is opened with the
 .BR open (2)
@@ -187,9 +185,12 @@ and
 .BR mkostemps ():
 are glibc extensions.
 .SH NOTES
-The old behavior of creating a file with mode 0666 may be
+In glibc versions 2.06 and earlier, the file is created with permissions 0666,
+that is, read and write for all users.
+This old behavior may be
 a security risk, especially since other UNIX flavors use 0600,
 and somebody might overlook this detail when porting programs.
+POSIX.1-2008 adds a requirement that the file be created with mode 0600.

 More generally, the POSIX specification of
 .BR mkstemp ()

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
