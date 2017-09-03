From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/4] crypt.3: documented "rounds" parameter for SHA-*
 algorithms
Date: Mon, 4 Sep 2017 01:38:40 +0200
Message-ID: <77463574-7a10-43cc-156f-82c0b3a5ac98@gmail.com>
References: <1504455396-760-1-git-send-email-konstantin@shemyak.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504455396-760-1-git-send-email-konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Konstantin,

On 09/03/2017 06:16 PM, Konstantin Shemyak wrote:
> SHA-256 and SHA-512 based encryption algorithms support passing
> number of hashing rounds in the salt string, like:
> 
> crypt("password", "$5$rounds=100000$saltsaltsalt")
> 
> This was present since introduction of SHA-*-based algorithms in the
> glibc commit c3266dc0d85ed519ff40d1738aadf7b1280af3ba.
> 
> The parameter is explained. Minor wording and formatting fixes done.
> 
> Konstantin Shemyak (4):
>   crypt.3: wfix: encryption is not done with SHA-xxx, but with a
>     function based on SHA-xxx.
>   crypt.3: ffix: added missing formatting
>   crypt.3: wfix: clarified that ending of the salt string with '$' is
>     optional
>   crypt.3: Added description of previously undocumented 'rounds'
>     parameter
> 
>  man3/crypt.3 | 30 +++++++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 7 deletions(-)

In general the patch series looks good, but I need some more
supporting information for the commit message and for checking details.
See comments on individual patches, in following mails.

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
