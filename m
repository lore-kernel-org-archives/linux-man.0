From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH manpages] umount.2: restore mention of data loss with
 MNT_FORCE
Date: Sat, 12 Aug 2017 22:07:14 +0200
Message-ID: <590f5b1a-607a-0de2-4ba7-37916106d4f9@gmail.com>
References: <87mv7asj5l.fsf@notabene.neil.brown.name>
 <508034ae-e254-d0bd-5ca9-c3f1959f8fe5@gmail.com>
 <8760dwrtqd.fsf@notabene.neil.brown.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <8760dwrtqd.fsf@notabene.neil.brown.name>
Content-Language: en-US
Sender: linux-fsdevel-owner@vger.kernel.org
To: NeilBrown <neilb@suse.com>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On 08/10/2017 05:23 AM, NeilBrown wrote:
> 
> Recent patch to description of MNT_FORCE incorrectly
> dropped the mention of possible data loss.  Restore it.
> 
> Signed-off-by: NeilBrown <neilb@suse.com>
> ---
> 
> Sorry, I thought I had put the mention of data loss back it, but clearly
> not.

Thanks, Neil. Applied.

Cheers,

Michael


>  man2/umount.2 | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/man2/umount.2 b/man2/umount.2
> index ccd1d07afe88..01f42710ee9d 100644
> --- a/man2/umount.2
> +++ b/man2/umount.2
> @@ -63,9 +63,10 @@ controlling the behavior of the operation:
>  .BR MNT_FORCE " (since Linux 2.1.116)"
>  Ask the filesystem to abort pending requests before attempting the
>  unmount.  This may allow the unmount to complete without waiting
> -for an inaccessible server.  If, after aborting requests, some
> -processes still have active references to the filesystem, the
> -unmount will still fail. In Linux 4.12, only the filesystems
> +for an inaccessible server, but could cause data loss.  If, after
> +aborting requests, some processes still have active references to the
> +filesystem, the unmount will still fail. In Linux 4.12, only the
> +filesystems
>  9p (2.6.16),
>  ceph (2.6.34),
>  cifs (2.6.12),
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
