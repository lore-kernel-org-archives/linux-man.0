From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH] ilogb.3: tfix
Date: Fri, 09 Aug 2013 09:19:48 +0800
Message-ID: <520443B4.7050408@cn.fujitsu.com>
References: <1375780370-11239-1-git-send-email-penght@cn.fujitsu.com> <520355FB.9010603@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <520355FB.9010603-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


On 08/08/2013 04:25 PM, Michael Kerrisk (man-pages) wrote:
> On 08/06/13 11:12, Peng Haitao wrote:
>>  When no error occurs, these functions
>>  are equivalent to the corresponding
>> -.BR logb (3)
>> +.BR logb (3),
>> +.BR logbf (3),
>> +and
>> +.BR logbl (3)
>>  functions, cast to
>>  .IR int .
>>  .SH RETURN VALUE
> 
> To my eye, the existing text is okay. So I've not applied this.
> 

OK, I see.
Thanks.


-- 
Best Regards,
Peng

> Cheers,
> 
> Michael
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
