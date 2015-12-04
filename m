From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PING][patch] ld.so.8: outline missed cases of secure run
Date: Fri, 04 Dec 2015 22:28:11 +0100
Message-ID: <5662056B.9040502@gmail.com>
References: <01f701d0e407$c718f530$554adf90$@guseva@samsung.com> <55F65D25.1080708@gmail.com> <00f601d1282e$e3e04ef0$aba0ecd0$@guseva@samsung.com> <CAKvUva-pDmq7Cuvh0=Ne+Z+tbTdxO=s5YX6KVa1dUeB=uw5YPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKvUva-pDmq7Cuvh0=Ne+Z+tbTdxO=s5YX6KVa1dUeB=uw5YPA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Silvan Jegen <s.jegen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maria Guseva <m.guseva-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Yury Gribov <y.gribov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, v.garbuzov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Silvan

On 11/26/2015 11:25 AM, Silvan Jegen wrote:
> Hi
> 
> Please find below a few typos I found while looking at the text.
> 
> On Thu, Nov 26, 2015 at 10:43 AM, Maria Guseva <m.guseva-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> So find the final patch below:
>>
>> diff --git a/man8/ld.so.8 b/man8/ld.so.8 index 8d8a759..112406e 100644
>> --- a/man8/ld.so.8
>> +++ b/man8/ld.so.8
>> @@ -61,8 +61,8 @@ of the binary if present and DT_RUNPATH attribute does not
>> exist.
>>  Use of DT_RPATH is deprecated.
>>  .IP o
>>  Using the environment variable
>> -.BR LD_LIBRARY_PATH .
>> -Except if the executable is a set-user-ID/set-group-ID binary,
>> +.BR LD_LIBRARY_PATH
>> +(unless the executable is being run in secure-execution mode; see below).
>>  in which case it is ignored.
>>  .IP o
>>  (ELF only) Using the directories specified in the @@ -166,15 +166,38 @@
>> environment variable setting (see below).
>>  .BI \-\-inhibit\-rpath " list"
>>  Ignore RPATH and RUNPATH information in object names in  .IR list .
>> -This option is ignored if
>> -.B ld.so
>> -is set-user-ID or set-group-ID.
>> +This option is ignored if when running in secure-execution mode (see
>> below).
> 
> either "if" or "when", not both

Yes.

>>  .TP
>>  .BI \-\-audit " list"
>>  Use objects named in
>>  .I list
>>  as auditors.
>>  .SH ENVIRONMENT
>> +Various environment variable influence the operation of the dynamic linker.
> 
> s/variable/variables/

Yes.

>> +.\"
>> +.SS Secure-execution mode
>> +For security reasons,
>> +the effects of some environment variables are voided or modified if the
>> +dynamic linker determines that the binary should be run in
>> +secure-execution mode.
>> +This determination is made by checking whether the .B AT_SECURE entry
>> +in the auxiliary vector (see .BR getauxval (3)) has a nonzero value.
>> +This entry may have a nonzero value for various reasons, including:
>> +.IP * 3
>> +The process's real and effective user IDs differ, or the real and
> 
> I think one writes process' instead of process's if a possessive 's
> follows an s at the end of the word.

"process's" works okay for me.

Cheers,

Michael


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
