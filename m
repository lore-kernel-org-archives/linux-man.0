From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: locale.1: update for 104511
Date: Mon, 18 Jan 2016 13:07:33 +0200
Message-ID: <569CC775.5080509@redhat.com>
References: <569CC4C8.9070608@redhat.com> <569CC5C5.40107@redhat.com>
Reply-To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <569CC5C5.40107-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

On 2016-01-18 13:00, Florian Weimer wrote:
> On 01/18/2016 11:56 AM, Marko Myllynen wrote:
>> Addresses https://bugzilla.kernel.org/show_bug.cgi?id=104511.
>>
>> ---
>>  man1/locale.1 | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/man1/locale.1 b/man1/locale.1
>> index c10355f..505191d 100644
>> --- a/man1/locale.1
>> +++ b/man1/locale.1
>> @@ -162,6 +162,10 @@ $ \fBlocale \-ck date_fmt\fP
>>  LC_TIME
>>  date_fmt="%a %b %e %H:%M:%S %Z %Y"
>>  
>> +$ \fBlocale -c charmap\fP
>> +LC_CTYPE
>> +UTF-8
>> +
> 
> I think this needs a comment that it shows the charset, or something like
> 
> For example, the keyword
> .B charmap
> causes
> .BR locale (1)
> to display the character set for the locale.

Fair enough, how about this?


Addresses https://bugzilla.kernel.org/show_bug.cgi?id=104511.

---
 man1/locale.1 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/man1/locale.1 b/man1/locale.1
index c10355f..a1cdfd8 100644
--- a/man1/locale.1
+++ b/man1/locale.1
@@ -65,6 +65,8 @@ metadata about each locale to be included in the output.
 .TP
 .BR \-m ", " \-\-charmaps
 Display the available charmaps (character set description files).
+To display the current character set for the locale, use
+\fBlocale -c charmap\fR.
 .PP
 The
 .B locale

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
