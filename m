From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH 1/2] splice.2: Note EAGAIN can occur when called on
 nonblocking file descriptors
Date: Sun, 5 May 2019 05:29:20 -0500
Message-ID: <ef394bac-705c-70ac-5ceb-adebf4cfece8@gmail.com>
References: <20190412140247.9897-1-kaslevs@vmware.com>
 <20190412140247.9897-2-kaslevs@vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412140247.9897-2-kaslevs@vmware.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Slavomir Kaslev <kaslevs@vmware.com>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, slavomir.kaslev@gmail.com
List-Id: linux-man@vger.kernel.org

Hello Slavomir,

On 4/12/19 9:02 AM, Slavomir Kaslev wrote:
> Signed-off-by: Slavomir Kaslev <kaslevs@vmware.com>

Thanks! Applied.

Cheers,

Michael


> ---
>   man2/splice.2 | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/man2/splice.2 b/man2/splice.2
> index 57988d9d6..af3fa4e74 100644
> --- a/man2/splice.2
> +++ b/man2/splice.2
> @@ -155,7 +155,9 @@ is set to indicate the error.
>   .B EAGAIN
>   .B SPLICE_F_NONBLOCK
>   was specified in
> -.IR flags ,
> +.IR flags
> +or one of the file descriptors had been marked as nonblocking
> +.RB ( O_NONBLOCK ) ,
>   and the operation would block.
>   .TP
>   .B EBADF
> 
