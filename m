From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH draft_keys 0/7] Minor edits
Date: Fri, 25 Nov 2016 11:01:27 +0100
Message-ID: <287f9dec-aa76-51b8-24e2-ede1cc8f78c4@gmail.com>
References: <51643019-bb42-4066-c824-c55b9e668ac6@man7.org>
 <20161125010043.GA25181@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161125010043.GA25181@obsidian>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Eugene,

On 11/25/2016 02:00 AM, Eugene Syromyatnikov wrote:
> Hello.
> 
> There are some minor edits to keyrings(7) (and one minor typo fix for
> keyctl(2)).

Thanks for this series!

> One additional idea: add_key(2) and request_key(2) have some duplication
> regarding special keyrings (as already noted in comments there),

(yes.)

> maybe
> add overview information regarding them (along with constant names)
> to the Keyrings section of the keyrings(7) and then reference it from
> add_key/request_key (with the notes regarding non-applicability of
> requestor keyring in add_key and such).

Yes, I'd wondered about doing something like that. But, I'm 
balancing that against inconvenience to the reader, by forcing
them to look at another page. So far, it seems best to leave
things as they are, but I'm still thinking about it.

> Another thought is to document group keyring (that it is present since
> beginning but has never been implemented), since it has a constant
> definition and one may think (upon possible discovery in headers) that
> it is just some undocumented feature.

I've added a few words on this to keyrings(7).

Everything is now pushed to Git.

Cheers,

Michael


> Eugene Syromyatnikov (7):
>   keyctl.2: tfix
>   keyrings.7: minor clarification rearding storage method used in
>     keyrings
>   keyrings.7: spacing fix
>   keyrings.7: minor clarification regarding decision whether to store
>     big_key in tmpfs or not
>   keyrings.7: tfix
>   keyrings.7: tfix
>   keyrings.7: information regarding pre-3.17 limits on
>     root_maxbytes/root_maxkeys
> 
>  man2/keyctl.2   |  1 -
>  man7/keyrings.7 | 20 ++++++++++++--------
>  2 files changed, 12 insertions(+), 9 deletions(-)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
