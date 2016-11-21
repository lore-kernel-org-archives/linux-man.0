From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/5] request_key.2: add information regarding default
 keyring
Date: Mon, 21 Nov 2016 23:08:33 +0100
Message-ID: <9c323ec8-227f-3f52-b8d8-caaaaac9196f@gmail.com>
References: <528b203d-ac72-e4a6-8517-e8c5c11055a4@gmail.com>
 <20161121205940.GA16505@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161121205940.GA16505@obsidian>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Eugene,

Thanks for taking a shot at this. I'd really be keen to hear from 
David on this before I apply.

David, could you comment please?

Cheers,

Michael

On 11/21/2016 09:59 PM, Eugene Syromyatnikov wrote:
> ---
>  man2/request_key.2 | 47 ++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 42 insertions(+), 5 deletions(-)
> 
> diff --git a/man2/request_key.2 b/man2/request_key.2
> index a9d0561..e29ca06 100644
> --- a/man2/request_key.2
> +++ b/man2/request_key.2
> @@ -35,11 +35,6 @@ If the key is found or created,
>  attaches it to the keyring whose ID is specified in
>  .I dest_keyring
>  and returns the key's serial number.
> -.\" FIXME Is 'keyring' allowed to be 0? Reading the source, it appears so.
> -.\" In this case, by default, the key is assigned to the session keyring.
> -.\" But, the KEYCTL_SET_REQKEY_KEYRING also seems to have an influence here.
> -.\" What are the details here?
> -.\"
>  
>  .BR request_key ()
>  first recursively searches for a matching key in all of the keyrings
> @@ -104,6 +99,48 @@ This specifies the caller's UID-specific keyring
>  .B KEY_SPEC_USER_SESSION_KEYRING
>  This specifies the caller's UID-session keyring
>  .RB ( user-session-keyring (7)).
> +.PP
> +When the
> +.I dest_keyring
> +is specified to
> +.BR 0 ,
> +and no key construction have been performed, then no additional linking is done.
> +Otherwise, if new key is constructed, it would be linked to the "default"
> +keyring (which can be specified via the
> +.BR keyctl (2)
> +command
> +.BR KEYCTL_SET_REQKEY_KEYRING ).
> +More specifically, when kernel tries to determine to which keyring the
> +newly constructed key should be linked, it tries the following options, starting
> +from the value set via
> +.BR KEYCTL_SET_REQKEY_KEYRING " " keyctl (2)
> +command until it finds the first available one:
> +.IP \(bu 3
> +.\" 8bbf4976b59fc9fc2861e79cab7beb3f6d647640
> +Requestor keyring (specified via
> +.BR KEY_REQKEY_DEFL_REQUESTOR_KEYRING ,
> +since Linux 2.6.29)
> +.IP \(bu
> +Thread-specific keyring (specified via
> +.BR KEY_REQKEY_DEFL_THREAD_KEYRING )
> +.IP \(bu
> +Process-specific keyring (specified via
> +.BR KEY_REQKEY_DEFL_PROCESS_KEYRING )
> +.IP \(bu
> +Session-specific keyring (specified via
> +.BR KEY_REQKEY_DEFL_SESSION_KEYRING )
> +.IP \(bu
> +Session keyring for the process's user ID  (specified via
> +.BR KEY_REQKEY_DEFL_USER_SESSION_KEYRING ).
> +This keyring is expected to always exist.
> +.IP \(bu
> +UID-specific keyring (specified via
> +.BR KEY_REQKEY_DEFL_USER_KEYRING ).
> +This keyring is also expected to always exist.
> +.PP
> +Specifying
> +.B KEY_REQKEY_DEFL_DEFAULT
> +leads to starting from the beginning of the list.
>  .\"
>  .SS Requesting user-space instantiation of a key
>  If the kernel cannot find a key matching
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
