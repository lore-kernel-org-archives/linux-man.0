From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH 2/2] tee.2: Note EAGAIN can occur when called on
 nonblocking file descriptors
Date: Sun, 5 May 2019 05:29:40 -0500
Message-ID: <a95fd0e5-adc9-5bdd-d00c-2d096c2fc3d1@gmail.com>
References: <20190412140247.9897-1-kaslevs@vmware.com>
 <20190412140247.9897-3-kaslevs@vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412140247.9897-3-kaslevs@vmware.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Slavomir Kaslev <kaslevs@vmware.com>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, slavomir.kaslev@gmail.com
List-Id: linux-man@vger.kernel.org

Hello again Slavomir,

On 4/12/19 9:02 AM, Slavomir Kaslev wrote:
> Signed-off-by: Slavomir Kaslev <kaslevs@vmware.com>

Thanks! Applied.

Cheers,

Michael


> ---
>   man2/tee.2 | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/man2/tee.2 b/man2/tee.2
> index 7bb0d3a31..03d043b46 100644
> --- a/man2/tee.2
> +++ b/man2/tee.2
> @@ -100,7 +100,9 @@ is set to indicate the error.
>   .B EAGAIN
>   .B SPLICE_F_NONBLOCK
>   was specified in
> -.IR flags ,
> +.IR flags
> +or one of the file descriptors had been marked as nonblocking
> +.RB ( O_NONBLOCK ) ,
>   and the operation would block.
>   .TP
>   .B EINVAL
> 
