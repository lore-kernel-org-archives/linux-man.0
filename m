From: "Michael Kerrisk" <mtk.manpages@googlemail.com>
Subject: Re: [PATCH] utimensat() non-conformances and fixes [v3]
Date: Tue, 3 Jun 2008 13:05:31 +0200
Message-ID: <cfd18e0f0806030405u1c32b114pa0fdd979f36f87fb@mail.gmail.com>
References: <482D4665.4050401@gmail.com>
	 <E1Jx3Gw-0002eA-55@pomaz-ex.szeredi.hu> <48401E7E.9090304@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754343AbYFCLGV@vger.kernel.org>
In-Reply-To: <48401E7E.9090304@gmail.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: drepper@redhat.com, viro@zeniv.linux.org.uk, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-man@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Hi Miklos,

> 2) I've found yet another divergence from the spec -- but this
> was in the original implementation, rather than being
> something that has been introduced.  In do_futimes() there is
>
>        if (!times && !(file->f_mode & FMODE_WRITE))
>                write_error = -EACCES;
>
> However, the check here should not be against the f_mode (file access
> mode), but the against actual permission of the file referred to by
> the underlying descriptor.  This means that for the do_futimes() +
> times==NULL case, a set-user-ID root program could open a file
> descriptor O_RDWR/O_WRONLY for which the real UID does not have write
> access, and then even after reverting the the effective UID, the real
> user could still update file.
>
> I'm not sure of the correct way to get the required nameidata (to do a
> vfs_permission() call) from the file descriptor.  Can you give me a
> tip there?

Could you point me at the right way of doing this?

Cheers,

Michael
