From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: CLONE_FILES description confusing
Date: Mon, 05 Sep 2016 20:10:23 +0200
Message-ID: <57CDB50F.4070201@bfs.de>
References: <CAJgzZopmS1ph4G4zMu-_chLjsyE4CLnZiuOPqXBC=vdUE9R96w@mail.gmail.com> <e9dc2d61-4d72-32f4-3fb7-8864dd575f32@gmail.com> <CAJgzZor_Ru3TJfjA0L9PFo7r+2asCD+BxW=GAgmdFHY_UR2Gag@mail.gmail.com> <57C17454.80707@bfs.de> <63e31345-ccb2-22c8-4584-62fb32db7d96@gmail.com>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <63e31345-ccb2-22c8-4584-62fb32db7d96-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org



Am 28.08.2016 06:43, schrieb Michael Kerrisk (man-pages):
> On 08/27/2016 11:07 PM, walter harms wrote:
>>
>>
>> Am 24.08.2016 02:11, schrieb enh:
>>> On Tue, Aug 23, 2016 at 4:52 PM, Michael Kerrisk (man-pages)
>>> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> Hello Elliott
>>>>

>>
>>
>> Just one note:
>> People are terrible bad at negation. So i would suggest:
>>
>> If  CLONE_FILES  is  set, the child process share
>> all file descriptors opened in the calling  process
>> at the time of clone().
>> Subsequent operations that open or close file descriptors,
>> or change  file  descriptor  flags, performed  by  either
>> the  calling  process  or  the child
>> process do also affect the other  process.
>>  Note,  however,
>>  that  the duplicated file descriptors in the child refer to
>>  the same open file descriptions as the  corresponding  file
>>  descriptors  in  the  calling  process, and thus share file
>>  offsets and files status flags (see open(2)).
> 
> Hi Walter,
> 
> I am having trouble to see what you find wrong, and what you want to change,
> since the text comparison is difficult. Could you formulate this as a patch?
> 
> Thanks,
> 
> Michael
> 
>  

Most people are bad at negations. The patch attempts to reword the
description of the CLONE_FILES without describing "what is not does
when not set".

This changes not the whole file but it should give an idea how it could be done.

re,
 wh


----

diff --git a/man2/clone.2 b/man2/clone.2
index b867961..fd25e38 100644
--- a/man2/clone.2
+++ b/man2/clone.2
@@ -172,6 +172,17 @@ Store the child thread ID at the location
 in the child's memory.
 .TP
 .BR CLONE_FILES " (since Linux 2.0)"
+
+By default the child process still inherits a copy of all file descriptors
+opened in the calling process at the time of
+.BR clone ().
+The child and parent process can close or change
+file descriptors independently.
+The duplicated file descriptors in the child refer to the same open file
+descriptions as the corresponding file descriptors in the calling process,
+and thus share file offsets and files status flags (see
+.BR open (2)).
+
 If
 .B CLONE_FILES
 is set, the calling process and the child process share the same file
@@ -187,20 +198,6 @@ If a process sharing a file descriptor table calls
 .BR execve (2),
 its file descriptor table is duplicated (unshared).

-If
-.B CLONE_FILES
-is not set, the child process inherits a copy of all file descriptors
-opened in the calling process at the time of
-.BR clone ().
-Subsequent operations that open or close file descriptors,
-or change file descriptor flags,
-performed by either the calling
-process or the child process do not affect the other process.
-Note, however,
-that the duplicated file descriptors in the child refer to the same open file
-descriptions as the corresponding file descriptors in the calling process,
-and thus share file offsets and files status flags (see
-.BR open (2)).
 .TP
 .BR CLONE_FS " (since Linux 2.0)"
 If

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
