From: Florian Weimer <fweimer@redhat.com>
Subject: [PATCH glibc] Linux: Include <linux/sockios.h> in <bits/socket.h> under __USE_MISC
Date: Mon, 22 Jul 2019 13:31:12 +0200
Message-ID: <87ftmys3un.fsf@oldenburg2.str.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: libc-alpha@sourceware.org, Sergei Trofimovich <slyfox@gentoo.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, mtk.manpages@gmail.com, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Historically, <asm/socket.h> (which is included from <bits/socket.h>)
provided ioctl operations for sockets.  User code accessed them
through <sys/socket.h>.  The kernel UAPI headers have removed these
definitions in favor of <linux/sockios.h>.  This commit makes them
available via <sys/socket.h> again.

[[[
This is related to this thread:

From: Sergei Trofimovich <slyfox@gentoo.org>
Subject: linux-headers-5.2 and proper use of SIOCGSTAMP
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, libc-alpha@sourceware.org
Cc: Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
 mtk.manpages@gmail.com, linux-man@vger.kernel.org
Date: Sat, 20 Jul 2019 17:48:44 +0100 (1 day, 18 hours, 40 minutes ago)
Message-ID: <20190720174844.4b989d34@sf>

I have tried to verify this against our 3.10 kernel headers and the 5.2
headers, and I do not see any failures in glibc itself (the latter with
build-many-glibcs.py).  Impact on application code is unclear at this
point, of course.

This patch depends on the earlier Linux 5.2 compatibility patch which
introduced <bits/socket-constants.h>.
]]]

2019-07-22  Florian Weimer  <fweimer@redhat.com>

	* sysdeps/unix/sysv/linux/bits/socket.h [__USE_MISC]: Include
	<linux/sockios.h>.

diff --git a/sysdeps/unix/sysv/linux/bits/socket.h b/sysdeps/unix/sysv/linux/bits/socket.h
index 082f8b9031..ff5b705f41 100644
--- a/sysdeps/unix/sysv/linux/bits/socket.h
+++ b/sysdeps/unix/sysv/linux/bits/socket.h
@@ -352,6 +352,7 @@ struct ucred
 #ifdef __USE_MISC
 # include <bits/types/time_t.h>
 # include <asm/socket.h>
+# include <linux/sockios.h>
 #else
 # define SO_DEBUG 1
 # include <bits/socket-constants.h>
