From: Jeff B <JeffBatHome-yboC7gn3QBoJzESkhhYsnQ@public.gmane.org>
Subject: Re: fs(5) man page is out of date
Date: Wed, 19 May 2010 15:31:55 -0400
Message-ID: <4BF43CAB.7090907@myLetters.US>
References: <4BF2BAD0.5070100@myLetters.US> <20100518185651.GQ16800@machine.or.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070109040003030304030605"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100518185651.GQ16800-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeff B <JeffBatHome-yboC7gn3QBoJzESkhhYsnQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------070109040003030304030605
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


> On 05/18/2010 02:56 PM, Petr Baudis wrote:
>
> Hi!
>
> On Tue, May 18, 2010 at 12:05:36PM -0400, Jeff B wrote:
>    
>> Just FYI the fs(5) man page is woefully out of date.  The version on your
>> website at http://www.kernel.org/doc/man-pages/online/pages/man5/fs.5.html,
>> dated 2007-12-14, does not mention EXT4 and NTFS, among other things.
>>      
>    Patches are welcome.
>
>    Kind regards,
> 				Petr "Pasky" Baudis
>    

OK, you want a patch, you get a patch.   This is against the latest
version, man-pages-3.24, of the filesystems.5 man page.  I added
references to ext4 and ntfs by condensing information I took from
the Wikipedia pages for those file systems.

I hope it is acceptable that I attached the patch in diff -u format;
pasting it into this eMail was converting tabs into spaces.

>  cksum  filesystems.5.2010-05-19.new.patch.u
55916840 1656 filesystems.5.2010-05-19.new.patch.u


Jeff Barry


--------------070109040003030304030605
Content-Type: text/plain;
 name="filesystems.5.2010-05-19.new.patch.u"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="filesystems.5.2010-05-19.new.patch.u"

--- filesystems.5.man-pages-3.24.ori	2010-02-25 23:46:53.000000000 -0500
+++ filesystems.5.2010-05-19.new	2010-05-19 15:08:55.653199451 -0400
@@ -22,12 +22,14 @@
 .\"
 .\" 2007-12-14 mtk Added Reiserfs, XFS, JFS.
 .\"
-.TH FILESYSTEMS 5 2007-12-14 "Linux" "Linux Programmer's Manual"
+.\" 2010-05-19 Jeff Barry, Added ext4 and ntfs.
+.\"
+.TH FILESYSTEMS 5 2010-05-19 "Linux" "Linux Programmer's Manual"
 .nh
 .SH NAME
-filesystems \- Linux file-system types: minix, ext, ext2, ext3, Reiserfs,
+filesystems \- Linux file-system types: minix, ext, ext2, ext3, ext4, Reiserfs,
 XFS, JFS, xia, msdos,
-umsdos, vfat, proc, nfs, iso9660, hpfs, sysv, smb, ncpfs
+umsdos, vfat, ntfs, proc, nfs, iso9660, hpfs, sysv, smb, ncpfs
 .SH DESCRIPTION
 When, as is customary, the
 .B proc
@@ -77,6 +79,9 @@
 It is easy to
 switch back and forth between ext2 and ext3.
 .TP
+.B ext4
+is a set of upgrades to ext3 including substantial performance and reliability enhancements, plus huge increases in volume, file, and directory size limits.
+.TP
 .B Reiserfs
 is a journaling file system, designed by Hans Reiser,
 that was integrated into Linux in kernel 2.4.1.
@@ -116,6 +121,9 @@
 is an extended DOS file system used by Microsoft Windows95 and Windows NT.
 VFAT adds the capability to use long filenames under the MSDOS file system.
 .TP
+.B ntfs
+replaces Microsoft Window's *FAT* file systems (eg VFAT, FAT32).  It has reliability, performance, and space utilization enhancements plus features like ACLs, journaling, encryption, etc.
+.TP
 .B proc
 is a pseudo file system which is used as an interface to kernel data
 structures rather than reading and interpreting

--------------070109040003030304030605--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
