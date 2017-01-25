From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: Typo in readdir.3
Date: Wed, 25 Jan 2017 17:04:09 +0100
Message-ID: <5888CC79.5010608@bfs.de>
References: <d4218e32-719f-9517-a85b-e7d6f6882737@intel.com> <6b3d5a4d-7ff1-a8f9-9dd4-281903b86014@gmail.com>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6b3d5a4d-7ff1-a8f9-9dd4-281903b86014-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tadeusz Struk <tadeusz.struk-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org



Am 25.01.2017 01:09, schrieb Michael Kerrisk (man-pages):
> On 01/25/2017 11:48 AM, Tadeusz Struk wrote:
>> diff --git a/man3/readdir.3 b/man3/readdir.3
>> index 866fd45..677af62 100644
> 
> Thanks, Tadeusz, Patch applied.
> 
> Cheers,
> 
> Michael
> 
> 
>> --- a/man3/readdir.3
>> +++ b/man3/readdir.3
>> @@ -230,7 +230,7 @@ A directory stream is opened using
>>  The order in which filenames are read by successive calls to
>>  .BR readdir ()
>>  depends on the filesystem implementation;
>> -it us unlikely that the names will be sorted in any fashion.
>> +it is unlikely that the names will be sorted in any fashion.

perhaps a bit simpler:
      name are not sorted

re,
 wh

>>  
>>  Only the fields
>>  .I d_name
>>
>>
>> Thanks,
>>
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
