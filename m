From: bill o gallmeister <bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: for review: posix-spawn*, the remaining bits
Date: Mon, 28 Sep 2009 14:32:54 -0700
Message-ID: <4AC12B86.1000705@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The attached are various linkage files with little informational content--they just .so the content pages I sent a couple of days ago.  It seemed
annoying to send them all separately.

diff --git a/man3/posix_spawn_file_actions_addclose.3 b/man3/posix_spawn_file_actions_addclose.3
new file mode 100644
index 0000000..62ed8c1
--- /dev/null
+++ b/man3/posix_spawn_file_actions_addclose.3
@@ -0,0 +1 @@
+.so man3/posix_spawn_file_actions_addopen.3
diff --git a/man3/posix_spawn_file_actions_adddup2.3 b/man3/posix_spawn_file_actions_adddup2.3
new file mode 100644
index 0000000..62ed8c1
--- /dev/null
+++ b/man3/posix_spawn_file_actions_adddup2.3
@@ -0,0 +1 @@
+.so man3/posix_spawn_file_actions_addopen.3
diff --git a/man3/posix_spawn_file_actions_destroy.3 b/man3/posix_spawn_file_actions_destroy.3
new file mode 100644
index 0000000..4c93004
--- /dev/null
+++ b/man3/posix_spawn_file_actions_destroy.3
@@ -0,0 +1 @@
+.so man3/posix_spawn_file_actions_init.3
diff --git a/man3/posix_spawnattr_destroy.3 b/man3/posix_spawnattr_destroy.3
new file mode 100644
index 0000000..3330979
--- /dev/null
+++ b/man3/posix_spawnattr_destroy.3
@@ -0,0 +1 @@
+.so man3/posix_spawnattr_init.3
diff --git a/man3/posix_spawnattr_getschedparam.3 b/man3/posix_spawnattr_getschedparam.3
new file mode 100644
index 0000000..0dfdbcf
--- /dev/null
+++ b/man3/posix_spawnattr_getschedparam.3
@@ -0,0 +1 @@
+.so man3/posix_spawnattr_getschedpolicy.3
diff --git a/man3/posix_spawnattr_setflags.3 b/man3/posix_spawnattr_setflags.3
new file mode 100644
index 0000000..fada4ac
--- /dev/null
+++ b/man3/posix_spawnattr_setflags.3
@@ -0,0 +1 @@
+.so man3/posix_spawnattr_getflags.3
diff --git a/man3/posix_spawnattr_setpgroup.3 b/man3/posix_spawnattr_setpgroup.3
new file mode 100644
index 0000000..c2521f4
--- /dev/null
+++ b/man3/posix_spawnattr_setpgroup.3
@@ -0,0 +1 @@
+.so man3/posix_spawnattr_getpgroup.3
diff --git a/man3/posix_spawnattr_setschedparam.3 b/man3/posix_spawnattr_setschedparam.3
new file mode 100644
index 0000000..2416e9e
--- /dev/null
+++ b/man3/posix_spawnattr_setschedparam.3
@@ -0,0 +1 @@
+.so man3/posix_spawnattr_getschedparam.3
diff --git a/man3/posix_spawnattr_setschedpolicy.3 b/man3/posix_spawnattr_setschedpolicy.3
new file mode 100644
index 0000000..0dfdbcf
--- /dev/null
+++ b/man3/posix_spawnattr_setschedpolicy.3
@@ -0,0 +1 @@
+.so man3/posix_spawnattr_getschedpolicy.3
diff --git a/man3/posix_spawnattr_setsigdefault.3 b/man3/posix_spawnattr_setsigdefault.3
new file mode 100644
index 0000000..fbffeae
--- /dev/null
+++ b/man3/posix_spawnattr_setsigdefault.3
@@ -0,0 +1 @@
+.so man3/posix_spawnattr_getsigdefault.3
diff --git a/man3/posix_spawnattr_setsigmask.3 b/man3/posix_spawnattr_setsigmask.3
new file mode 100644
index 0000000..8c9b4a3
--- /dev/null
+++ b/man3/posix_spawnattr_setsigmask.3
@@ -0,0 +1 @@
+.so man3/posix_spawnattr_getsigmask.3
diff --git a/man3/posix_spawnp.3 b/man3/posix_spawnp.3
new file mode 100644
index 0000000..a6f49d0
--- /dev/null
+++ b/man3/posix_spawnp.3
@@ -0,0 +1 @@
+.so man3/posix_spawn.3
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
