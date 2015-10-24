From: Daniel Colascione <dancol-CpwT7fMy01Ydnm+yROfE0A@public.gmane.org>
Subject: [patch] document that O_TMPFILE works with shm_open
Date: Sat, 24 Oct 2015 00:01:45 -0700
Message-ID: <562B2CD9.80901@dancol.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This test program works fine. (Watch it work in strace.) This patch is
against git master. It's okay to document accidental features, right?

int
main()
{
    int shmfd = shm_open(".", O_TMPFILE | O_RDWR | O_EXCL, 0600);
    ftruncate(shmfd, 1000);
    mmap(NULL, 1000, PROT_READ | PROT_WRITE, MAP_SHARED, shmfd, 0);

    return 0;
}


diff --git a/man3/shm_open.3 b/man3/shm_open.3
index 6b04f39..7b9b7c3 100644
--- a/man3/shm_open.3
+++ b/man3/shm_open.3
@@ -116,6 +116,32 @@ object can be set using
 The newly allocated bytes of a shared memory
 object are automatically initialized to 0.
 .TP
+.BR O_TMPFILE " (since Linux 3.11)"
+.BR shm_open ()
+can be used to create an anonymous shared memory region by using exactly
+the string "." as
+.I name
+and including both
+.B O_TMPFILE
+and
+.B O_EXCL
+in
+.I oflag
+while omitting
+.B O_CREAT
+.
+Shared memory regions created this way work just like ones created without
+.B O_TMPFILE
+and with
+.B O_CREAT
+except that they are automatically released and their contents
discarded when the
+last reference to the
+region disappears.  References are either
+.BR mmap (2)
+mappings or file descriptors.
+See also
+.BR memfd_create (2).
+.TP
 .B O_EXCL
 If
 .B O_CREAT
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
