From: "Michael Kerrisk (man-opages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 01/15] add_key.2, request_key.2, keyrings.7: update Linux
 documentation pointers
Date: Mon, 11 Sep 2017 15:54:46 +0200
Message-ID: <7273baf7-ab5d-a9ab-394c-0af657b67c96@gmail.com>
References: <20170911030350.GA29734@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170911030350.GA29734-ZbobWygYI+YXGNroddHbYwC/G2K4zDHf@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/11/2017 05:03 AM, Eugene Syromyatnikov wrote:
> In 4.13 release cycle, key management documentation has been reformatted
> to ReStructured text and moved to a separate "keys" directory.

Applied. Thanks!

Cheers,

Michael


> Relevant kernel commits: v4.13-rc1~34^2~27, v4.13-rc1~34^2~25
> 
> * man2/add_key.2 (.SH SEE ALSO): Amend pointers to
> Documentation/security/keys.txt and Documentation/keys-request-key.txt
> with changes introduced in Linux 4.13 (Documentation/keys/core.rst and
> Documentation/keys/request-key.rst).
> * man2/request_key.2 (.SH SEE ALSO): Likewise.
> * man7/keyrings.7 (.SH SEE ALSO): Likewise.
> 
> Signed-off-by: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   man2/add_key.2     | 8 +++++++-
>   man2/request_key.2 | 8 +++++++-
>   man7/keyrings.7    | 4 +++-
>   3 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/man2/add_key.2 b/man2/add_key.2
> index 2e67362..6417334 100644
> --- a/man2/add_key.2
> +++ b/man2/add_key.2
> @@ -284,6 +284,12 @@ main(int argc, char *argv[])
>   .BR user\-session\-keyring (7)
>   .PP
>   The kernel source files
> +.IR Documentation/security/keys/core.rst
> +and
> +.IR Documentation/keys/request\-key.rst
> +(or, before Linux 4.13, in the files
> +.\" commit b68101a1e8f0263dbc7b8375d2a7c57c6216fb76
>   .IR Documentation/security/keys.txt
>   and
> -.IR Documentation/security/keys\-request\-key.txt .
> +.\" commit 3db38ed76890565772fcca3279cc8d454ea6176b
> +.IR Documentation/security/keys\-request\-key.txt ).
> diff --git a/man2/request_key.2 b/man2/request_key.2
> index ce987e3..e6a5c7d 100644
> --- a/man2/request_key.2
> +++ b/man2/request_key.2
> @@ -561,6 +561,12 @@ main(int argc, char *argv[])
>   .BR request\-key (8)
>   .PP
>   The kernel source files
> +.IR Documentation/security/keys/core.rst
> +and
> +.IR Documentation/keys/request\-key.rst
> +(or, before Linux 4.13, in the files
> +.\" commit b68101a1e8f0263dbc7b8375d2a7c57c6216fb76
>   .IR Documentation/security/keys.txt
>   and
> -.IR Documentation/security/keys\-request\-key.txt .
> +.\" commit 3db38ed76890565772fcca3279cc8d454ea6176b
> +.IR Documentation/security/keys\-request\-key.txt ).
> diff --git a/man7/keyrings.7 b/man7/keyrings.7
> index 0cb1190..6f2581c 100644
> --- a/man7/keyrings.7
> +++ b/man7/keyrings.7
> @@ -870,4 +870,6 @@ scripts can use them.
>   The kernel source files
>   .IR Documentation/crypto/asymmetric-keys.txt
>   and under
> -.IR Documentation/security/keys .
> +.IR Documentation/security/keys
> +(or, before Linux 4.13, in the file
> +.IR Documentation/security/keys.txt ).
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
