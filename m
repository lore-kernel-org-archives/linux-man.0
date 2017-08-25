From: Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>
Subject: Re: man page update (fcntl(2) new set/get write hints)
Date: Fri, 25 Aug 2017 14:43:56 -0600
Message-ID: <580f238c-4c3d-eddc-5330-19f8a971bce1@kernel.dk>
References: <25b8e025-d49b-e033-5ba3-f6967a6a970f@kernel.dk>
 <feffa54b-d1b4-02e3-5a24-0a8e51f96762@gmail.com>
 <39f20b08-9a35-652e-4ae9-96f3cb8e5679@kernel.dk>
 <CAKgNAkizCBiky9QM0-oyP3taGKCDTjAP--SCgqZ3pC8Kz=PnPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------1C70BB9C7656353A3ADF956E"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkizCBiky9QM0-oyP3taGKCDTjAP--SCgqZ3pC8Kz=PnPw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------1C70BB9C7656353A3ADF956E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 08/24/2017 04:10 PM, Michael Kerrisk (man-pages) wrote:
> Hello Jens,
> 
> On 24 August 2017 at 16:39, Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org> wrote:
>> On 08/23/2017 04:41 PM, Michael Kerrisk (man-pages) wrote:
>>> Hello Jens,
>>>
>>> On 07/31/2017 05:24 PM, Jens Axboe wrote:
>>>> Hi Michael,
>>>>
>>>> Not sure what the best way to submit this is, but I wrote an
>>>> update for the fcntl man page to cover the new set/get write
>>>> hints commands that are added in 4.13. Attaching the patch, but
>>>> you can also find it below, in a fork of your github repo:
>>>>
>>>> https://github.com/axboe/man-pages/commits/fcntl-write-hints
>>>
>>> Thanks for the patch. Some questions below.
>>>
>>>> From 3eee36f14a650e50f14b42ae1d4fec33e78e6254 Mon Sep 17 00:00:00 2001
>>>> From: Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>
>>>> Date: Mon, 26 Jun 2017 16:58:29 -0600
>>>> Subject: [PATCH] man2/fcntl.2: add description of new read/write hint commands
>>>>
>>>> This adds a description of the new read/write hint commands:
>>>>
>>>> F_GET_RW_HINT                Get inode read/write hint
>>>> F_SET_RW_HINT                Set inode read/write hint
>>>> F_GET_FILE_RW_HINT   Get file read/write hint
>>>> F_SET_FILE_RW_HINT   Set file read/write hint
>>>>
>>>> and the currently available values, as of Linux 4.13.
>>>>
>>>> Signed-off-by: Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>
>>>> ---
>>>>  man2/fcntl.2 | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 58 insertions(+)
>>>>
>>>> diff --git a/man2/fcntl.2 b/man2/fcntl.2
>>>> index 70758d2fcd99..07eacc9564fa 100644
>>>> --- a/man2/fcntl.2
>>>> +++ b/man2/fcntl.2
>>>> @@ -5,6 +5,7 @@
>>>>  .\" and Copyright (C) 2002-2010, 2014 Michael Kerrisk;
>>>>  .\" and Copyright (C) 2014 Jeff Layton
>>>>  .\" and Copyright (C) 2014 David Herrmann
>>>> +.\" and Copyright (C) 2017 Jens Axboe
>>>>  .\"
>>>>  .\" %%%LICENSE_START(VERBATIM)
>>>>  .\" Permission is granted to make and distribute verbatim copies of this
>>>> @@ -61,6 +62,8 @@
>>>>  .\" Document F_SETPIPE_SZ and F_GETPIPE_SZ.
>>>>  .\" 2014-07-08, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>  .\"     Document F_ADD_SEALS and F_GET_SEALS
>>>> +.\" 2017-06-26, Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>
>>>> +.\"     Document F_{GET,SET}_RW_HINT and F_{GET,SET}_FILE_RW_HINT
>>>>  .\"
>>>>  .TH FCNTL 2 2017-05-03 "Linux" "Linux Programmer's Manual"
>>>>  .SH NAME
>>>> @@ -1490,6 +1493,61 @@ Furthermore, if there are any asynchronous I/O operations
>>>>  .RB ( io_submit (2))
>>>>  pending on the file,
>>>>  all outstanding writes will be discarded.
>>>> +.SS File read/write hints
>>>> +Write life time hints can be used to inform the kernel about the relative
>>>> +expected life time of writes on a given inode or file. An application may
>>>> +use this interface for separating writes into different write classes,
>>>> +so that multiple users or applications running on a single storage back-end
>>>> +can aggregate their IO patterns in a consistent manner. However, there are
>>>> +no functional semantics implied by these flags, and different IO classes
>>>> +can use the write life time hints in arbitrary ways so long as they are used
>>>> +consistently.
>>>
>>> I read the above, and it is still not clear to me what a "write lifetime"
>>> is. Can you add some text to explain? (I'm guessing that it means the
>>> amount of time before the data is overwritten by another write, but I'm
>>> not sure of that, and it needs to be more explicit in the text.)
>>
>> You are right, it's exactly what it refers to. It's essentially data
>> lifetime hints for a write command. I'd be happy to take suggestions to
>> improve the description of it.
> 
> Well, a sentence something like my above is probably a start, but I'd
> prefer you worded something, since it might contain more insight than
> anything that I propose.

Could perhaps insert a sentence (after the first one) like the following:

"Life time refers to the expected time the data will live on media, before
being overwritten or erased."

>>>> +.BR F_GET_RW_HINT " (\fIuint64_t\fP; since Linux 4.13)"
>>>> +Returns the value of the read/write hint associated with the underlying inode
>>>> +for the file descriptor.
>>>> +.TP
>>>> +.BR F_SET_RW_HINT " (\fIuint64_t\fP; since Linux 4.13)"
>>>> +Sets the read/write hint value associated with the underlying inode for the
>>>> +file descriptor.
>>>> +.TP
>>>> +.BR F_GET_FILE_RW_HINT " (\fIuint64_t\fP; since Linux 4.13)"
>>>> +Returns the value of the read/write hint associated with the file descriptor.
>>>
>>> Do you mean here "file descriptor" or "file description (i.e., the
>>> open file handle)? Maybe you mean the former, but I want to confirm.
>>
>> I do mean file descriptor.
> 
> So, what are the semantics if a file descriptor is duplicated using
> dup(2) or similar? If I understand correctly, then the write lifetime
> hint has no effect for the new file descriptor, right?

If it's dup(2)'ed, then the new file descriptor will refer to the same
hints as the previous. See attached test file.

-- 
Jens Axboe


--------------1C70BB9C7656353A3ADF956E
Content-Type: text/x-csrc;
 name="test-writehints.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="test-writehints.c"

/*
 * test-writehints.c: test file/inode write hint setting/getting
 */
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdbool.h>
#include <inttypes.h>
#include <assert.h>

#ifndef F_GET_RW_HINT
#define F_LINUX_SPECIFIC_BASE	1024
#define F_GET_RW_HINT		(F_LINUX_SPECIFIC_BASE + 11)
#define F_SET_RW_HINT		(F_LINUX_SPECIFIC_BASE + 12)
#define F_GET_FILE_RW_HINT	(F_LINUX_SPECIFIC_BASE + 13)
#define F_SET_FILE_RW_HINT	(F_LINUX_SPECIFIC_BASE + 14)

#define RWH_WRITE_LIFE_NOT_SET	0
#define RWH_WRITE_LIFE_NONE	1
#define RWH_WRITE_LIFE_SHORT	2
#define RWH_WRITE_LIFE_MEDIUM	3
#define RWH_WRITE_LIFE_LONG	4
#define RWH_WRITE_LIFE_EXTREME	5

#endif

static int __get_write_hint(int fd, int cmd)
{
	uint64_t hint;
	int ret;

	ret = fcntl(fd, cmd, &hint);
	if (ret < 0) {
		perror("fcntl: F_GET_RW_FILE_HINT");
		return -1;
	}

	return hint;
}

static int get_file_write_hint(int fd)
{
	return __get_write_hint(fd, F_GET_FILE_RW_HINT);
}

static int get_inode_write_hint(int fd)
{
	return __get_write_hint(fd, F_GET_RW_HINT);
}

static void set_file_write_hint(int fd, uint64_t hint)
{
	uint64_t set_hint = hint;
	int ret;

	ret = fcntl(fd, F_SET_FILE_RW_HINT, &set_hint);
	if (ret < 0) {
		perror("fcntl: F_RW_SET_HINT");
		return;
	}
}

static void set_inode_write_hint(int fd, uint64_t hint)
{
	uint64_t set_hint = hint;
	int ret;

	ret = fcntl(fd, F_SET_RW_HINT, &set_hint);
	if (ret < 0) {
		perror("fcntl: F_RW_SET_HINT");
		return;
	}
}

int main(int argc, char *argv[])
{
	char filename[] = "/tmp/writehintsXXXXXX";
	int ihint, fhint, fd, dupfd;

	fd = mkstemp(filename);
	if (fd < 0) {
		perror("open");
		return 2;
	}

	/*
	 * Default hints for both file and inode should be NOT_SET
	 */
	fhint = get_file_write_hint(fd);
	if (fhint < 0)
		return 0;
	ihint = get_inode_write_hint(fd);
	assert(fhint == ihint);
	assert(fhint == RWH_WRITE_LIFE_NOT_SET);

	/*
	 * Set inode hint, check file hint returns the right hint
	 */
	set_inode_write_hint(fd, RWH_WRITE_LIFE_SHORT);
	fhint = get_file_write_hint(fd);
	ihint = get_inode_write_hint(fd);
	assert(fhint == ihint);
	assert(fhint == RWH_WRITE_LIFE_SHORT);

	/*
	 * Check that a duped descriptor returns the right hint
	 */
	dupfd = dup(fd);
	fhint = get_file_write_hint(dupfd);
	ihint = get_inode_write_hint(dupfd);
	assert(fhint == RWH_WRITE_LIFE_SHORT);
	assert(ihint == RWH_WRITE_LIFE_SHORT);

	/*
	 * Now set file hint, ensure that this is now the hint we get
	 */
	set_file_write_hint(fd, RWH_WRITE_LIFE_LONG);
	fhint = get_file_write_hint(fd);
	ihint = get_inode_write_hint(fd);
	assert(fhint == RWH_WRITE_LIFE_LONG);
	assert(ihint == RWH_WRITE_LIFE_SHORT);

	/*
	 * Clear inode write hint, ensure that file still returns the set hint
	 */
	set_inode_write_hint(fd, RWH_WRITE_LIFE_NOT_SET);
	fhint = get_file_write_hint(fd);
	ihint = get_inode_write_hint(fd);
	assert(fhint == RWH_WRITE_LIFE_LONG);
	assert(ihint == RWH_WRITE_LIFE_NOT_SET);

	/*
	 * Clear file write hint, ensure that now returns cleared
	 */
	set_file_write_hint(fd, RWH_WRITE_LIFE_NOT_SET);
	fhint = get_file_write_hint(fd);
	assert(fhint == RWH_WRITE_LIFE_NOT_SET);

	close(fd);
	close(dupfd);
	unlink(filename);
	return 0;
}

--------------1C70BB9C7656353A3ADF956E--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
