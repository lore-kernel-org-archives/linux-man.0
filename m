From: Vlastimil Babka <caster-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [patch] CPU_SET.3: CPU_COUNT() and CPU_COUNT_S() return int, not
 void
Date: Thu, 11 Feb 2010 12:05:42 +0100
Message-ID: <4B73E486.9090303@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi, found a minor error in man-pages 3.23, git is the same (2008-11-14).
The functions return a number of CPU's, so void is obviously wrong, in 
my glibc-2.11 it's declared as int (__sched_cpucount() in 
/usr/include/bits/sched.h).

Patch below. Regards,
Vlastimil Babka

diff --git a/man3/CPU_SET.3 b/man3/CPU_SET.3
index cf186c8..a03f23b 100644
--- a/man3/CPU_SET.3
+++ b/man3/CPU_SET.3
@@ -41,7 +41,7 @@ macros for manipulating CPU sets
  .BI "void CPU_CLR(int " cpu ", cpu_set_t *" set );
  .BI "int  CPU_ISSET(int " cpu ", cpu_set_t *" set );
  .sp
-.BI "void CPU_COUNT(cpu_set_t *" set );
+.BI "int  CPU_COUNT(cpu_set_t *" set );
  .sp
  .BI "void CPU_AND(cpu_set_t *" destset ,
  .BI "             cpu_set_t *" srcset1 ", cpu_set_t *" srcset2 );
@@ -62,7 +62,7 @@ macros for manipulating CPU sets
  .BI "void CPU_CLR_S(int " cpu ", size_t " setsize ", cpu_set_t *" set );
  .BI "int  CPU_ISSET_S(int " cpu ", size_t " setsize ", cpu_set_t *" set );
  .sp
-.BI "void CPU_COUNT_S(size_t " setsize ", cpu_set_t *" set );
+.BI "int  CPU_COUNT_S(size_t " setsize ", cpu_set_t *" set );
  .sp
  .BI "void CPU_AND_S(size_t " setsize ", cpu_set_t *" destset ,
  .BI "             cpu_set_t *" srcset1 ", cpu_set_t *" srcset2 );
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
