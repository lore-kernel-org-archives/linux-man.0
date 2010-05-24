From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: fs(5) man page is out of date
Date: Mon, 24 May 2010 09:23:11 +0200
Message-ID: <AANLkTilvJe1XxwAFtKOu8Z85nz3xutMb-sCTMGtiRnzS@mail.gmail.com>
References: <4BF2BAD0.5070100@myLetters.US> <20100518185651.GQ16800@machine.or.cz>
	<4BF43CAB.7090907@myLetters.US>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4BF43CAB.7090907-yboC7gn3QBoJzESkhhYsnQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff B <JeffBatHome-XMwiTyDR5eL3nsQPz6zGkQ@public.gmane.org>
Cc: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jeff,

On Wed, May 19, 2010 at 9:31 PM, Jeff B <JeffBatHome-XMwiTyDR5eL3nsQPz6zGkQ@public.gmane.org> wrot=
e:
>
>> On 05/18/2010 02:56 PM, Petr Baudis wrote:
>>
>> Hi!
>>
>> On Tue, May 18, 2010 at 12:05:36PM -0400, Jeff B wrote:
>>
>>>
>>> Just FYI the fs(5) man page is woefully out of date. =A0The version=
 on your
>>> website at
>>> http://www.kernel.org/doc/man-pages/online/pages/man5/fs.5.html,
>>> dated 2007-12-14, does not mention EXT4 and NTFS, among other thing=
s.
>>>
>>
>> =A0 Patches are welcome.
>>
>> =A0 Kind regards,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Petr =
"Pasky" Baudis
>>
>
> OK, you want a patch, you get a patch. =A0 This is against the latest
> version, man-pages-3.24, of the filesystems.5 man page. =A0I added
> references to ext4 and ntfs by condensing information I took from
> the Wikipedia pages for those file systems.
>
> I hope it is acceptable that I attached the patch in diff -u format;
> pasting it into this eMail was converting tabs into spaces.

Inline is best. There's usually a way to do this in most mail clients
(though not always obvious).

Thanks for the patch! I tweaked it a little, and applied the form below=
=2E

The change will be in man-pages-3.25.

Cheers,

Michael

--- a/man5/filesystems.5
+++ b/man5/filesystems.5
@@ -22,12 +22,12 @@
 .\"
 .\" 2007-12-14 mtk Added Reiserfs, XFS, JFS.
 .\"
-.TH FILESYSTEMS 5 2007-12-14 "Linux" "Linux Programmer's Manual"
+.TH FILESYSTEMS 5 2010-05-24 "Linux" "Linux Programmer's Manual"
 .nh
 .SH NAME
-filesystems \- Linux file-system types: minix, ext, ext2, ext3, Reiser=
fs,
+filesystems \- Linux file-system types: minix, ext, ext2, ext3, ext4, =
Reiserfs,
 XFS, JFS, xia, msdos,
-umsdos, vfat, proc, nfs, iso9660, hpfs, sysv, smb, ncpfs
+umsdos, vfat, ntfs, proc, nfs, iso9660, hpfs, sysv, smb, ncpfs
 .SH DESCRIPTION
 When, as is customary, the
 .B proc
@@ -77,6 +77,12 @@ is a journaling version of the ext2 file system.
 It is easy to
 switch back and forth between ext2 and ext3.
 .TP
+.B ext4
+is a set of upgrades to ext3 including substantial performance and
+reliability enhancements,
+plus large increases in volume, file, and directory size limits.
+.TP
+ .B Reiserfs
 .B Reiserfs
 is a journaling file system, designed by Hans Reiser,
 that was integrated into Linux in kernel 2.4.1.
@@ -116,6 +122,11 @@ sacrificing compatibility with DOS.
 is an extended DOS file system used by Microsoft Windows95 and Windows=
 NT.
 VFAT adds the capability to use long filenames under the MSDOS file sy=
stem.
 .TP
+.B ntfs
+replaces Microsoft Window's FAT file systems (VFAT, FAT32).
+It has reliability, performance, and space-utilization enhancements
+plus features like ACLs, journaling, encryption, and so on.
+.TP
 .B proc
 is a pseudo file system which is used as an interface to kernel data
 structures rather than reading and interpreting




--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
