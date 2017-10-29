From: Silvan Jegen <s.jegen@gmail.com>
Subject: Re: [PATCH] readv.2: document RWF_NOWAIT
Date: Sun, 29 Oct 2017 10:17:52 +0100
Message-ID: <20171029091752.GA1322@myarchbang.localdomain>
References: <20171029084023.8463-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171029084023.8463-1-hch@lst.de>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: linux-man@vger.kernel.org, linux-fsdevel@vger.kernel.org, milosz@adfin.com
List-Id: linux-man@vger.kernel.org

Hi

found two typos below.

On Sun, Oct 29, 2017 at 10:40:23AM +0200, Christoph Hellwig wrote:
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  man2/readv.2 | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/man2/readv.2 b/man2/readv.2
> index 831cf6260..21d82849e 100644
> --- a/man2/readv.2
> +++ b/man2/readv.2
> @@ -232,6 +232,25 @@ This flag is meaningful only for
>  .BR pwritev2 (),
>  and its effect applies only to the data range written by the system call.
>  .\" commit e864f39569f4092c2b2bc72c773b6e486c7e3bd9
> +.TP
> +.BR RWF_NOWAIT " (since Linux 4.14)"
> +Dot not wait for data when it cannot be instantly retreived.  If this flag

s/Dot/Do/;s/retreived/retrieved/


Cheers,

Silvan
