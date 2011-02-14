From: Akira Fujita <a-fujita-cUW4a6blu5N8UrSeD/g0lQ@public.gmane.org>
Subject: Re: [PATCH] sendfile.2: Fix description of the out_fd
Date: Mon, 14 Feb 2011 19:11:19 +0900
Message-ID: <4D58FFC7.9060804@rs.jp.nec.com>
References: <4D413168.1080901@rs.jp.nec.com> <AANLkTimMgyM+bUmePtxL83PZdQfRFdZes-hmOLAARRvp@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTimMgyM+bUmePtxL83PZdQfRFdZes-hmOLAARRvp-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UHJ6ZW15c8WCYXcgUGF3ZcWCY3p5aw==?= <przemoc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Przemys=C5=82aw,

Thank you for comment :)
Would you review this patch again?

Regards,
Akira Fujita

---

--- man-pages-3.32-a/man2/sendfile.2    2010-12-03 16:01:59.000000000 +=
0900
+++ man-pages-3.32-b/man2/sendfile.2    2011-02-14 09:02:57.000000000 +=
0900
@@ -87,15 +87,17 @@ and the file offset will be updated by t
  .I count
  is the number of bytes to copy between the file descriptors.

-Presently (Linux 2.6.9):
-.IR in_fd ,
+.IR in_fd
  must correspond to a file which supports
  .BR mmap (2)-like
  operations
-(i.e., it cannot be a socket);
-and
-.I out_fd
-must refer to a socket.
+(i.e., it cannot be a socket).
+
+.IR out_fd
+was required to be a socket, but since Linux 2.6.33 it can be
+any file. If it is a regular file, then
+.BR sendfile()
+changes its offset appropriately.

  Applications may wish to fall back to
  .BR read (2)/ write (2)
@@ -165,7 +167,7 @@ to minimize the number of packets and to

  In Linux 2.4 and earlier,
  .I out_fd
-could refer to a regular file, and
+could also refer to a regular file, and
  .BR sendfile ()
  changed the current offset of that file.

(2011/02/13 5:11), Przemys=C5=82aw Pawe=C5=82czyk wrote:
> Hi,
>
> 2011/1/27 Akira Fujita<a-fujita-cUW4a6blu5N8UrSeD/g0lQ@public.gmane.org>:
>> commit cc56f7de7f00d188c7c4da1e9861581853b9e92f made
>> sendfile(2) can work with any output file.
>> Therefore the out_fd of sendfile(2) can refer to any file,
>> but current manual (man-pages-3.32) has not been changed so far.
>
> And I thought I was the only one discovering it recently (beside a fe=
w
> obvious people year ago). :)
>
>> diff -Nrup man-pages-3.32-a/man2/sendfile.2 man-pages-3.32-b/man2/se=
ndfile.2
>> --- man-pages-3.32-a/man2/sendfile.2    2010-12-03 16:01:59.00000000=
0 +0900
>> +++ man-pages-3.32-b/man2/sendfile.2    2011-01-27 16:03:48.00000000=
0 +0900
>> @@ -87,15 +87,11 @@ and the file offset will be updated by t
>>   .I count
>>   is the number of bytes to copy between the file descriptors.
>>
>> -Presently (Linux 2.6.9):
>> -.IR in_fd ,
>> +.IR in_fd
>>   must correspond to a file which supports
>>   .BR mmap (2)-like
>>   operations
>> -(i.e., it cannot be a socket);
>> -and
>> -.I out_fd
>> -must refer to a socket.
>> +(i.e., it cannot be a socket).
>
> I don't think that completely removing out_fd socket restriction part
> is a proper way of fixing this page. Such information should not be
> lost.
> I would add here sth like:
>
> out_fd was required to be a socket, but since Linux 2.6.33 it can be
> any file. If it is a regular file, then sendfile() changes its offset
> appropriately.
>
>>
>>   Applications may wish to fall back to
>>   .BR read (2)/ write (2)
>> @@ -168,6 +164,9 @@ In Linux 2.4 and earlier,
>>   could refer to a regular file, and
>
> s/could/could also/
>
>>   .BR sendfile ()
>>   changed the current offset of that file.
>
>> +Since 2.6.33,
>> +.I out_fd
>> +can refer to any file.
>
> IMO this change shouldn't be mentioned in NOTES section.
>
>>
>>   The original Linux
>>   .BR sendfile ()
>
> Regards.
>

--=20
Akira Fujita <a-fujita-cUW4a6blu5N8UrSeD/g0lQ@public.gmane.org>

The First Fundamental Software Development Group,
Software Development Division,
NEC Software Tohoku, Ltd.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
