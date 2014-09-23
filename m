From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 84701] execve(2) manual page ".sh" usage exposes implementation
 detail
Date: Tue, 23 Sep 2014 04:23:32 +0000
Message-ID: <bug-84701-11311-kopoYrW9CJ@https.bugzilla.kernel.org/>
References: <bug-84701-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-84701-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=84701

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         Resolution|---                         |CODE_FIX

--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Alex, thanks for the detailed report. I've applied the patch below.

Cheers,

Michael

diff --git a/man2/execve.2 b/man2/execve.2
index 0b06974..dfa933b 100644
--- a/man2/execve.2
+++ b/man2/execve.2
@@ -729,10 +729,10 @@ program:

 .in +4n
 .nf
-.RB "$" " cat > script.sh"
-.B #! ./myecho script-arg
+.RB "$" " cat > script"
+.B #!./myecho script-arg
 .B ^D
-.RB "$" " chmod +x script.sh"
+.RB "$" " chmod +x script"
 .fi
 .in

@@ -740,10 +740,10 @@ We can then use our program to exec the script:

 .in +4n
 .nf
-.RB "$" " ./execve ./script.sh"
+.RB "$" " ./execve ./script"
 argv[0]: ./myecho
 argv[1]: script-arg
-argv[2]: ./script.sh
+argv[2]: ./script
 argv[3]: hello
 argv[4]: world
 .fi

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
