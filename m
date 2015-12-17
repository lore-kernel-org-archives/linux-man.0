From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: Unit of /proc/sys/kernel/random/poolsize
Date: Thu, 17 Dec 2015 21:56:19 +0100
Message-ID: <56732173.20905@bfs.de>
References: <CAG-2HqXo9GqNmiSt2npnBwx+F9_03eUTcxujgt_vNmdGhX8i6A@mail.gmail.com> <5672699D.5010803@gmail.com>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5672699D.5010803-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tom Gundersen <teg-B22kvLQNl6c@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org



Am 17.12.2015 08:51, schrieb Michael Kerrisk (man-pages):
> Hello Tom,
> 
> On 10/22/2011 02:13 PM, Tom Gundersen wrote:
>> Hi,
>>
>> This might not be so much a bug report, as a request for clarification.
>>
>> In random(4) it is explained that /proc/sys/kernel/random/poolsize
>> contains the value in bits or bytes in >=2.6 and 2.4 respectively.
>> However, the example in the preceding paragraph assumes a 2.4 kernel
>> is being used, and treats the value as if it were in bytes.
>>
>> I ran across this as I maintain the initscripts for Arch Linux, where
>> we have been (mistakenly) following the example even though we use a
>> 3.0 kernel. Maybe it would be worthwhile to change the example into
>> the 2.6 interface, or at least include a word of caution?
>>
>> I realise that using a value which is too large, probably does no harm
>> at all, but not being cryptography expert, I'd rather not take the
>> chance.
> 
> Long after the fact... I applied the patch below.
> Okay?
> 
> Thanks for the report.
> 
> Cheers,
> 
> Michael
> 
> PS I am going to be in Oslo a couple of times in coming months.
> Perhaps we could meet up for a beer or so.
> 
> diff --git a/man4/random.4 b/man4/random.4
> index 2519981..4a32aac 100644
> --- a/man4/random.4
> +++ b/man4/random.4
> @@ -171,7 +171,7 @@ This reduces the actual amount of noise in the entropy pool
>  below the estimate.
>  In order to counteract this effect, it helps to carry
>  entropy pool information across shut-downs and start-ups.
> -To do this, add the following lines to an appropriate script
> +To do this, add the lines to an appropriate script
>  which is run during the Linux system start-up sequence:
>  
>  .nf
> @@ -186,7 +186,8 @@ which is run during the Linux system start-up sequence:
>      fi
>      chmod 600 $random_seed
>      poolfile=/proc/sys/kernel/random/poolsize
> -    [ \-r $poolfile ] && bytes=\`cat $poolfile\` || bytes=512
> +    [ \-r $poolfile ] && bits=\`cat $poolfile\` || bits=4096

I believe it was end of the 80's when $( ) was introduced to replace \`
Since this example is for 2.6 maybe it would be useful to use it and
improve readability ?

re,
 wh


> +    bytes=$(expr $bits / 8)
>      dd if=/dev/urandom of=$random_seed count=1 bs=$bytes
>  .fi
>  
> @@ -201,9 +202,14 @@ run during the Linux system shutdown:
>      touch $random_seed
>      chmod 600 $random_seed
>      poolfile=/proc/sys/kernel/random/poolsize
> -    [ \-r $poolfile ] && bytes=\`cat $poolfile\` || bytes=512
> +    [ \-r $poolfile ] && bits=\`cat $poolfile\` || bits=4096
> +    bytes=$(expr $bits / 8)
>      dd if=/dev/urandom of=$random_seed count=1 bs=$bytes
>  .fi
> +
> +In the above examples, we assume Linux 2.6.0 or later, where
> +.IR /proc/sys/kernel/random/poolsize
> +returns the size of the entropy pool in bits (see below).
>  .SS /proc Interface
>  The files in the directory
>  .I /proc/sys/kernel/random
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
