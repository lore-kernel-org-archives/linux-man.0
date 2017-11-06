From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: FILESYSTEMS(5) SMB and VFAT feedback
Date: Mon, 6 Nov 2017 23:24:21 +0100
Message-ID: <5c090966-ba7b-a70c-e723-bcee26c100b4@gmail.com>
References: <c94369a9-102f-1c4f-19b4-2b7bc029a321@jguk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c94369a9-102f-1c4f-19b4-2b7bc029a321-hus3n9K41k0@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 11/05/2017 01:19 PM, Jonny Grant wrote:
> Hello Michael
> 
> Two pieces of feedback about this page:

Hello Johnny,

I've pushed some changes in response to this.
Please see Git.

Cheers,

Michael

> 1) I expect this sunsite should be a link to 
> https://www.samba.org/samba/smbfs/  ?
> 
> 
> http://man7.org/linux/man-pages/man5/filesystems.5.html
> 
> 
> smb       is a network filesystem that supports the SMB protocol,
>                   used by Windows for Workgroups, Windows NT, and Lan Man‐
>                   ager.
> 
>                   To use smb fs, you need a special mount program, which can
>                   be found in the ksmbfs package, found at
>  
> ⟨ftp://sunsite.unc.edu/pub/Linux/system/Filesystems/smbfs⟩.
> 
> 
> BTW, could "smbmount" to kernel man pages?
> 
> 
> 2)   vfat      is an extended DOS filesystem used by Microsoft Windows95
>                   and Windows NT.  vfat adds the capability to use long 
> file‐
>                   names under the MSDOS filesystem.
> 
> 
> 
> I'd be inclined to call it an "extended FAT filesystem", can that be 
> changed? No one refers to it as DOS for around 22 years. Everyone calls 
> it FAT.
> 
> ie
> 
> "is an extended FAT filesystem supported since Microsoft Windows95 and 
> Windows NT 3.5.  vfat adds the capability to use long file‐names under 
> the FAT filesystem."
> 
> 
> Cheers
> Jonny
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
