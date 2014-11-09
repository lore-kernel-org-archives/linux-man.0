From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: ioctl_list.2: complete overhaul needed
Date: Sun, 09 Nov 2014 16:50:06 +0100
Message-ID: <545F8D2E.5030308@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Hello Michael,

the current ioctl_list.2 man-page descripton starts
"This  is  Ioctl List 1.3.27, a list of ioctl calls in Linux/i386 kernel 
1.3.27."
So the man-page represents the state of Sep 14th, 1995.
It enumerates only 421 out of over 1200 calls.

The list contains hex values of different constants. I just wonder for 
which architecture (alpha, i386, mips, or sparc at that time). No 
information is supplied.

Current values depend on the architecture, e.g.

On amd64
0x82307201      VFAT_IOCTL_READDIR_BOTH
0x82307202      VFAT_IOCTL_READDIR_SHORT
0x80047210      FAT_IOCTL_GET_ATTRIBUTES
0x40047211      FAT_IOCTL_SET_ATTRIBUTES
0x80047213      FAT_IOCTL_GET_VOLUME_ID

On mips
0x42187201      VFAT_IOCTL_READDIR_BOTH
0x42187202      VFAT_IOCTL_READDIR_SHORT
0x40047210      FAT_IOCTL_GET_ATTRIBUTES
0x80047211      FAT_IOCTL_SET_ATTRIBUTES
0x40047213      FAT_IOCTL_GET_VOLUME_ID

Hence hex values should be removed.

I further suggest to remove all documentation of structure details.

The following command can be used to create the raw data for a new list

grep -GHrn -B3 -A3 --regexp="\s_IO[R|W|RW]\?[_BAD]\?\s*(" \
include/uapi | \
sed ':a;N;$!ba;s/\\\s*\n[^-]*-[^-]*-/ /g' | \
sort | \
grep --regexp="\s_IO[R|W|RW]\?[BAD]\?\s*(" | grep -n ''

Best regards

Heinrich Schuchardt
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
