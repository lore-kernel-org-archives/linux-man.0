From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH man-pages v1] fcntl.2: update manpage with verbiage about
 open file description locks
Date: Wed, 30 Apr 2014 16:05:09 +0200
Message-ID: <53610315.10908@gmail.com>
References: <1398797474-744-1-git-send-email-jlayton@poochiereds.net>	<5360D56F.4070509@gmail.com> <20140430081501.3aca5cba@tlielax.poochiereds.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140430081501.3aca5cba@tlielax.poochiereds.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeff Layton <jlayton@poochiereds.net>
Cc: mtk.manpages@gmail.com, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

Hi Jeff,

I'll follow up on your reply in a moment. But, in the meantime, you missed 
a question of mine:

>>> +.TP
>>> +.BR F_OFD_SETLK " (\fIstruct flock *\fP)"
>>> +Acquire an open file description lock (when
>>> +.I l_type
>>> +is
>>> +.B F_RDLCK
>>> +or
>>> +.BR F_WRLCK )
>>> +or release an open file description lock (when
>>> +.I l_type
>>> +is
>>> +.BR F_UNLCK )
>>> +on the bytes specified by the
>>> +.IR l_whence ", " l_start ", and " l_len
>>> +fields of
>>> +.IR lock .
>>> +If a conflicting lock is held by another process,
>>> +this call returns \-1 and sets
>>> +.I errno
>>> +to
>>> +.B EACCES
>>> +or
>>> +.BR EAGAIN .
>>
>> The "EACCES or EAGAIN" thing comes from POSIX, because different 
>> implementations of tradition record locks returned one of these errors. 
>> So, portable applications using traditional locks must handle either 
>> possibility. However, that argument doesn't apply for these new locks. 
>> Surely, we just want to say "set errno to EAGAIN" for this case?

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
