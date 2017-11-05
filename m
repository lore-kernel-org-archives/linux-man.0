From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: FILESYSTEMS(5) SMB and VFAT feedback
Date: Sun, 05 Nov 2017 20:31:10 +0100
Message-ID: <59FF66FE.2050905@bfs.de>
References: <c94369a9-102f-1c4f-19b4-2b7bc029a321@jguk.org>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c94369a9-102f-1c4f-19b4-2b7bc029a321-hus3n9K41k0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org



Am 05.11.2017 13:19, schrieb Jonny Grant:
> Hello Michael
> 
> Two pieces of feedback about this page:
> 
> 1) I expect this sunsite should be a link to
> https://www.samba.org/samba/smbfs/  ?
> 
> 
> http://man7.org/linux/man-pages/man5/filesystems.5.html
> 
> 
> smb       is a network filesystem that supports the SMB protocol,
>                  used by Windows for Workgroups, Windows NT, and Lan Man‐
>                  ager.
> 
>                  To use smb fs, you need a special mount program, which can
>                  be found in the ksmbfs package, found at
> 
> ⟨ftp://sunsite.unc.edu/pub/Linux/system/Filesystems/smbfs⟩.
> 
> 
> BTW, could "smbmount" to kernel man pages?
> 
> 
> 2)   vfat      is an extended DOS filesystem used by Microsoft Windows95
>                  and Windows NT.  vfat adds the capability to use long
> file‐
>                  names under the MSDOS filesystem.
> 
> 
> 
> I'd be inclined to call it an "extended FAT filesystem", can that be
> changed? No one refers to it as DOS for around 22 years. Everyone calls
> it FAT.
> 

I thing that is more correct, it is an "extended FAT filesystem". But a
lot of people still call is DOS filesystem.

re,
 wh


> ie
> 
> "is an extended FAT filesystem supported since Microsoft Windows95 and
> Windows NT 3.5.  vfat adds the capability to use long file‐names under
> the FAT filesystem."
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
