From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PING][patch] ld.so.8: outline missed cases of secure run
Date: Fri, 04 Dec 2015 22:27:59 +0100
Message-ID: <5662055F.5010708@gmail.com>
References: <"01f701d0e407$c718f530$554adf90$@guseva"@samsung.com> <55F65D25.1080708@gmail.com> <"00f601d1282e$e3e04ef0$aba0ecd0$@guseva"@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <"00f601d1282e$e3e04ef0$aba0ecd0$@guseva"@samsung.com>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maria Guseva <m.guseva-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, 'Yury Gribov' <y.gribov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, v.garbuzov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/26/2015 10:43 AM, Maria Guseva wrote:
> Gentle ping.
> 
>> Ping.
> 
>> On 09/22/2015 11:58 AM, Maria Guseva wrote:
> 
>> Hello Michael, Yury
> 
>>> What do you think of the alternative patch below?
>> Thank you, the patch you proposed looks much better. 

Sorry for the long delay in reply. I've merged my version of 
this patch now. Thanks for reviewing it.

Cheers,

Michael


>>>>> While at it, could you also mention that /etc/suid-debug enables 
>>>>> LD_DEBUG for suids?
>>>>
>>>> Does it? I can't see that in the glibc source. Am I missing something?
> 
>>> I was looking at process_envvars (in rtld.c): it resets dl_debug_mask for
> AT_SECURE binaries unless /etc/suid-debug exists.
> 
>> So I think it should mentioned in LD_DEBUG environment variable
> description, here:
>> .B LD_DEBUG
>> -is ignored for set-user-ID/set-group-ID binaries.
>> +is ignored in secure-execution mode.
>> +However, if the file
>> +.IR /etc/suid\-debug
>> +exists (the content of the file is irrelevant), then .BR LD_DEBUG has 
>> +an effect in secure-execution mode.
>> .TP
> 
> 
> So find the final patch below:
> 
> diff --git a/man8/ld.so.8 b/man8/ld.so.8 index 8d8a759..112406e 100644
> --- a/man8/ld.so.8
> +++ b/man8/ld.so.8
> @@ -61,8 +61,8 @@ of the binary if present and DT_RUNPATH attribute does not
> exist.
>  Use of DT_RPATH is deprecated.
>  .IP o
>  Using the environment variable
> -.BR LD_LIBRARY_PATH .
> -Except if the executable is a set-user-ID/set-group-ID binary,
> +.BR LD_LIBRARY_PATH
> +(unless the executable is being run in secure-execution mode; see below).
>  in which case it is ignored.
>  .IP o
>  (ELF only) Using the directories specified in the @@ -166,15 +166,38 @@
> environment variable setting (see below).
>  .BI \-\-inhibit\-rpath " list"
>  Ignore RPATH and RUNPATH information in object names in  .IR list .
> -This option is ignored if
> -.B ld.so
> -is set-user-ID or set-group-ID.
> +This option is ignored if when running in secure-execution mode (see
> below).
>  .TP
>  .BI \-\-audit " list"
>  Use objects named in
>  .I list
>  as auditors.
>  .SH ENVIRONMENT
> +Various environment variable influence the operation of the dynamic linker.
> +.\"
> +.SS Secure-execution mode
> +For security reasons,
> +the effects of some environment variables are voided or modified if the 
> +dynamic linker determines that the binary should be run in 
> +secure-execution mode.
> +This determination is made by checking whether the .B AT_SECURE entry 
> +in the auxiliary vector (see .BR getauxval (3)) has a nonzero value.
> +This entry may have a nonzero value for various reasons, including:
> +.IP * 3
> +The process's real and effective user IDs differ, or the real and 
> +effective group IDs differ.
> +This typically occurs as a result of executing a set-user-ID or 
> +set-group-ID program.
> +.IP *
> +A process with a non-root user ID executed a binary that conferred 
> +permitted or effective capabilities.
> +.IP *
> +A nonzero value may have been set by a Linux Security Module.
> +.\"
> +.SS Environment variables
>  Among the more important environment variables are the following:
>  .TP
>  .B LD_ASSUME_KERNEL
> @@ -235,7 +258,7 @@ The items in the list are separated by either colons or
> semicolons.
>  Similar to the
>  .B PATH
>  environment variable.
> -Ignored in set-user-ID and set-group-ID programs.
> +This variable is ignore in secure-execution mode.
>  .TP
>  .B LD_PRELOAD
>  A list of additional, user-specified, ELF shared @@ -243,7 +266,7 @@
> objects to be loaded before all others.
>  The items of the list can be separated by spaces or colons.
>  This can be used to selectively override functions in other shared objects.
>  The objects are searched for using the rules given under DESCRIPTION.
> -For set-user-ID/set-group-ID ELF binaries,
> +In secure-execution mode,
>  preload pathnames containing slashes are ignored,  and shared objects in
> the standard search directories are loaded  only if the set-user-ID mode bit
> is enabled on the shared object file.
> @@ -282,7 +305,7 @@ to be loaded before all others in a separate linker
> namespace  would occur in the process).
>  These objects can be used to audit the operation of the dynamic linker.
>  .B LD_AUDIT
> -is ignored for set-user-ID/set-group-ID binaries.
> +is ignored in secure-execution mode.
>  
>  The dynamic linker will notify the audit  shared objects at so-called
> auditing checkpoints\(emfor example, @@ -313,7 +336,7 @@ prints a help
> message about which categories can be specified in this  environment
> variable.
>  Since glibc 2.3.4,
>  .B LD_DEBUG
> -is ignored for set-user-ID/set-group-ID binaries.
> +is ignored in secure-execution mode.
> +However, if the file
> +.IR /etc/suid\-debug
> +exists (the content of the file is irrelevant), then .BR LD_DEBUG has 
> +an effect in secure-execution mode.
>  .TP
> .B LD_DEBUG_OUTPUT
>  (glibc since 2.1)
> @@ -322,14 +345,14 @@ File in which
>  output should be written.
>  The default is standard error.
>  .B LD_DEBUG_OUTPUT
> -is ignored for set-user-ID/set-group-ID binaries.
> +is ignored in secure-execution mode.
>  .TP
>  .B LD_DYNAMIC_WEAK
>  (glibc since 2.1.91)
>  Allow weak symbols to be overridden (reverting to old glibc behavior).
> -For security reasons, since glibc 2.3.4,
> +Since glibc 2.3.4,
>  .B LD_DYNAMIC_WEAK
> -is ignored for set-user-ID/set-group-ID binaries.
> +is ignored in secure-execution mode.
>  .TP
>  .B LD_HWCAP_MASK
>  (glibc since 2.1)
> @@ -348,9 +371,9 @@ version numbers.
>  .B LD_ORIGIN_PATH
>  (glibc since 2.1)
>  Path where the binary is found (for non-set-user-ID programs).
> -For security reasons, since glibc 2.4,
> +Since glibc 2.4,
>  .B LD_ORIGIN_PATH
> -is ignored for set-user-ID/set-group-ID binaries.
> +is ignored in secure-execution mode.
>  .\" Only used if $ORIGIN can't be determined by normal means  .\" (from the
> origin path saved at load time, or from /proc/self/exe)?
>  .TP
> @@ -382,16 +405,16 @@ If this variable is not defined, or is defined as an
> empty string,  then the default is  .IR /var/tmp .
>  .B LD_PROFILE_OUTPUT
> -is ignored for set-user-ID and set-group-ID programs,
> +is ignored in secure-execution mode.
>  which always use
>  .IR /var/profile .
>  .TP
>  .B LD_SHOW_AUXV
>  (glibc since 2.1)
>  Show auxiliary array passed up from the kernel.
> -For security reasons, since glibc 2.3.5,
> +Since glibc 2.3.5,
>  .B LD_SHOW_AUXV
> -is ignored for set-user-ID/set-group-ID binaries.
> +is ignored in secure-execution mode.
>  .TP
>  .B LD_TRACE_PRELINKING
>  (glibc since 2.4)
> @@ -421,7 +444,7 @@ If
>  .B LD_USE_LOAD_BIAS
>  is defined with the value 0,
>  neither executables nor PIEs will honor the base addresses.
> -This variable is ignored by set-user-ID and set-group-ID programs.
> +This variable is ignored in secure-execution mode.
>  .TP
>  .B LD_VERBOSE
>  (glibc since 2.1)
> @@ -507,6 +530,7 @@ mtrr, pat, pbe, pge, pn, pse36, sep, ss, sse, sse2, tm
> .BR sprof (1),  .BR dlopen (3),  .BR getauxval (3),
> +.BR capabilities (7),
>  .BR rtld-audit (7),
>  .BR ldconfig (8),
>  .BR sln (8)
> 
> 
> Regards,
> Maria
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
