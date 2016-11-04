From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: ptrace(2) ARM-specific details (request for patches)
Date: Fri, 4 Nov 2016 16:59:45 +0100
Message-ID: <f10daac4-4ead-5dee-2184-d35a02666006@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Pitre <nico-mo2vmkxb4K0@public.gmane.org>, Lennert Buytenhek <buytenh-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Will, Catalin, (and others in the To:)

As I mentioned to you both at LPC, over time there have been
a number of ARM-specific additions to ptrace(2), and these 
have not been documented yet. Would I be able to appeal to
you (and others in the To:) to send patches for these changes
(and future ptrace changes)?

The changes in question, for which I would be keen to receive
patches, are as follows:

PTRACE_GETWMMXREGS
PTRACE_SETWMMXREGS
    ARM 
    Linux 2.6.12

PTRACE_SET_SYSCALL
    ARM and ARM64
    Linux 2.6.16
    commit 3f471126ee53feb5e9b210ea2f525ed3bb9b7a7f
    Author: Nicolas Pitre <nico-mo2vmkxb4K0@public.gmane.org>
    Date:   Sat Jan 14 19:30:04 2006 +0000

PTRACE_GETCRUNCHREGS
PTRACE_SETCRUNCHREGS
    ARM 
    Linux 2.6.18
    commit 3bec6ded282b331552587267d67a06ed7fd95ddd
    Author: Lennert Buytenhek <buytenh-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>
    Date:   Tue Jun 27 22:56:18 2006 +0100

PTRACE_GETVFPREGS
PTRACE_SETVFPREGS
    ARM and ARM64
    Linux 2.6.30
    commit 3d1228ead618b88e8606015cbabc49019981805d
    Author: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
    Date:   Wed Feb 11 13:12:56 2009 +0100

PTRACE_GETHBPREGS
PTRACE_SETHBPREGS
    ARM and ARM64
    Linux 2.6.37
    commit 864232fa1a2f8dfe003438ef0851a56722740f3e
    Author: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
    Date:   Fri Sep 3 10:42:55 2010 +0100

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
