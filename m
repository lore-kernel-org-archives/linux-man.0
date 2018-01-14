From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [man-pages PATCH 0/5] some minor s390 syscall updates
Date: Sun, 14 Jan 2018 19:56:14 +0100
Message-ID: <20180114185614.GA12646@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martin Schwidefsky <schwidefsky-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Jan Glauber <jang-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Alexey Ishchuk <aishchuk-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello.

Recently I looked at the s390-specific system calls and noticed a few
things that are missing in the respective man pages and, from my point
of view, are worth documenting.

The information in the commits is based on the kernel sources and the
commit logs of the following files:
 - arch/s390/include/uapi/asm/sthyi.h
 - arch/s390/include/uapi/asm/guarded_storage.h
 - arch/s390/include/asm/runtime_instr.h
 - arch/s390/kernel/sthyi.c
 - arch/s390/kernel/guarded_storage.c
 - arch/s390/kernel/runtime_instr.c

One question for which I haven't found an answer, however, is the reason behind
the addition new syscalls instead of new arch-specific prctl options,
for example (especially in the case of s390_runtime_instr and, to some extent,
s390_guarded_storage and s390_sthyi).

Eugene Syromyatnikov (5):
  s390_runtime_instr.2: note that runtime_instr.h is not a public header
  s390_runtime_instr.2: document the removal of the second argument
  s390_sthyi.2: wfix
  s390_sthyi.2: some minor additions
  man2: describe s390_guarded_storage s390-specific system call

 man2/s390_guarded_storage.2 | 150 ++++++++++++++++++++++++++++++++++++++++++++
 man2/s390_runtime_instr.2   |  31 +++++++--
 man2/s390_sthyi.2           |  19 +++++-
 3 files changed, 193 insertions(+), 7 deletions(-)
 create mode 100644 man2/s390_guarded_storage.2

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
