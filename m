From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] umount.2: Homogeneous wording, don't recall function
 name
Date: Mon, 03 Mar 2014 05:49:21 +0100
Message-ID: <531409D1.10502@gmail.com>
References: <1393630618-11940-1-git-send-email-spaillard@debian.org> <20140301024259.GL19183@mraw.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140301024259.GL19183-xazfMhTT2R0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/01/2014 03:42 AM, Simon Paillard wrote:
> Hi,
> 
> On Sat, Mar 01, 2014 at 12:36:58AM +0100, Simon Paillard wrote:
>> See:
>> 	man2/link.2:An invalid flag value was specified in
>> 	man2/swapon.2:An invalid flag value was specified in
>> 	man2/umount.2:An invalid flag value was specified in
>> 	man2/unlink.2:An invalid flag value was specified in
> 
> Forget this patch, as umount manpage explains both umount() and umount2(),
> hence the need to explicit which function EINVAL details are about. 

Yup. 

Thanks,

Michael



>> ---
>>  man2/umount.2 | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/man2/umount.2 b/man2/umount.2
>> index 86fff50..18a87a0 100644
>> --- a/man2/umount.2
>> +++ b/man2/umount.2
>> @@ -137,8 +137,7 @@ or
>>  .BR MNT_FORCE .
>>  .TP
>>  .BR EINVAL " (since Linux 2.6.34)"
>> -.BR umount2 ()
>> -was called with an invalid flag value in
>> +An invalid flag value was specified in
>>  .IR flags .
>>  .TP
>>  .B ENAMETOOLONG
>> -- 
>> 1.8.5.3
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
