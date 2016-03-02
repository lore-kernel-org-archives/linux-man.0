From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Fix readdir_r with long file names
Date: Wed, 2 Mar 2016 09:17:37 +0100
Message-ID: <56D6A1A1.3040505@gmail.com>
References: <51B0B39F.4060202@redhat.com> <51B0BD36.3030202@redhat.com>
 <CAHGf_=r9Rz63pho+84ORk0a_oDyJSj-MCnZ56uPrT3L6sVEfeQ@mail.gmail.com>
 <20130607013024.GO29800@brightrain.aerifal.cx> <51B19203.3070307@redhat.com>
 <20130607144143.GQ29800@brightrain.aerifal.cx> <51B57E35.4080403@redhat.com>
 <51B65EA7.2020402@redhat.com> <20130611011324.GT29800@brightrain.aerifal.cx>
 <51B8702D.2060505@redhat.com>
 <20130813040038.GE21795@spoyarek.pnq.redhat.com>
 <520C88A6.9070501@redhat.com> <56D54DAD.1040306@gmail.com>
 <56D5CA79.9030204@redhat.com> <56D5F832.3070209@gmail.com>
 <56D5FB3D.5000306@redhat.com> <56D60335.7010906@gmail.com>
 <56D615D7.5020304@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D615D7.5020304-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 03/01/2016 11:21 PM, Florian Weimer wrote:
> On 03/01/2016 10:01 PM, Michael Kerrisk (man-pages) wrote:
>> On 03/01/2016 09:27 PM, Florian Weimer wrote:
>>> On 03/01/2016 09:14 PM, Michael Kerrisk (man-pages) wrote:
>>>
>>>> What happens with readdir() when it gets a filename that is larger 
>>>> than 255 characters?
>>>
>>> Good question.  Ugh.
>>>
>>> readdir will return a pointer to a struct dirent whose d_name member
>>> will not be null-terminated, but the memory following the struct dirent
>>> object will contain the rest of the name, and will eventually be
>>> null-terminated.
>>
>> So, in other words, if the caller users a declaration of the form
>>
>>     struct dirent d;
>>
>> (rather than say allocating a large buffer dynamically), then we have 
>> a buffer overrun?
> 
> readdir gives you only a struct dirent * to an internal buffer.  

D'oh! Yes, of course. I wasn't thinking clearly as I wrote that last night.

> If you do
> 
>   struct dirent *e = readdir (dir);
>   memcpy (&d, e, sizeof (d));
> 
> you can end up with a truncated name.  

Got it.

> According to Paul's comment, this
> kind of truncation is very visible on Solaris.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
