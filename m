From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH draft_keys 2/7] keyrings.7: minor clarification rearding
 storage method used in keyrings
Date: Fri, 25 Nov 2016 09:37:52 +0100
Message-ID: <07b9fbe1-2ab5-7db9-2aa9-72e8bfed7e46@gmail.com>
References: <51643019-bb42-4066-c824-c55b9e668ac6@man7.org>
 <20161125010057.GA345@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161125010057.GA345@obsidian>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/25/2016 02:00 AM, Eugene Syromyatnikov wrote:
> ---
>  man7/keyrings.7 | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Ahh -- good catch! Applied. Thanks, Eugene.

There was one typo in the title of the patch, but a more general
point: when the patch subject isn't tfix/wfix/etc., the first
word of the subject should have an initial capital 
(i.e., s/minor/Minor/).

Cheers,

Michael


> diff --git a/man7/keyrings.7 b/man7/keyrings.7
> index 81de084..ed3bbee 100644
> --- a/man7/keyrings.7
> +++ b/man7/keyrings.7
> @@ -117,7 +117,10 @@ to which the key is of interest
>  .IR """afs:mykey""" ).
>  .TP
>  .I """keyring"""
> -Keyrings are special keys whose payload consists of a set of links
> +'\" Note that keyrings use different fields in struct key in order to store
> +'\" their data - index_key instead of type/description and name_link/keys
> +'\" instead of payload.
> +Keyrings are special keys which store a set of links
>  to other keys (including other keyrings),
>  analogous to a directory holding links to files.
>  The main purpose of a keyring is to prevent other keys from
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
