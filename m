Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04355C4708E
	for <linux-man@archiver.kernel.org>; Mon,  2 Jan 2023 15:27:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236008AbjABP1Q (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 2 Jan 2023 10:27:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230120AbjABP1P (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 2 Jan 2023 10:27:15 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78DE93A1
        for <linux-man@vger.kernel.org>; Mon,  2 Jan 2023 07:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1672673196;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=U8WFYy1QhhwO8JBTjxXwg2SEka2+KMgPc6FjpRQ3tlQ=;
        b=WfLSshDCUlH0trJ8Xym7ieNZlfveI84T7icT1ZoGgZHtK/DefwoNjrZlYZcN4nvg8w8gpH
        q7BXtv4bopl+BOojoSlQd4UnO3pL1ArRmkR8ZG7D8Q/noM9pUgtdeScm1EipXDrBQcxt5n
        bFEaX3jSLL864fuJ0Z7PY82voikx9nQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-o-ASszwuMAuoCMPlU4oRXA-1; Mon, 02 Jan 2023 10:26:30 -0500
X-MC-Unique: o-ASszwuMAuoCMPlU4oRXA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F06173810780;
        Mon,  2 Jan 2023 15:26:26 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.2.16.30])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id B5882140EBF5;
        Mon,  2 Jan 2023 15:26:25 +0000 (UTC)
From:   Florian Weimer <fweimer@redhat.com>
To:     Alejandro Colomar via Libc-alpha <libc-alpha@sourceware.org>
Cc:     bugzilla-daemon@kernel.org, markgaleck@gmail.com,
        linux-man <linux-man@vger.kernel.org>,
        Alejandro Colomar <alx.manpages@gmail.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [Bug 216876] New: prototype for execveat() in the documentation
 appears wrong
References: <bug-216876-216477@https.bugzilla.kernel.org/>
        <1fed37b4-0bf6-0e20-56ff-2e006928989c@gmail.com>
Date:   Mon, 02 Jan 2023 16:26:23 +0100
In-Reply-To: <1fed37b4-0bf6-0e20-56ff-2e006928989c@gmail.com> (Alejandro
        Colomar via Libc-alpha's message of "Mon, 2 Jan 2023 16:02:05 +0100")
Message-ID: <87y1qllzz4.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

* Alejandro Colomar via Libc-alpha:

> It seems that glibc added a wrapper recently, and I didn't check that
> the prototype changed:
>
> alx@asus5775:~/src/gnu/glibc$ grepc execveat
> ./posix/unistd.h:300:
> extern int execveat (int __fd, const char *__path, char *const __argv[],
>                      char *const __envp[], int __flags)
>     __THROW __nonnull ((2, 3));
>
>
> ./sysdeps/unix/sysv/linux/execveat.c:25:
> int
> execveat (int dirfd, const char *path, char *const argv[], char *const envp[],
>           int flags)
> {
>   /* Avoid implicit array coercion in syscall macros.  */
>   return INLINE_SYSCALL_CALL (execveat, dirfd, path, &argv[0], &envp[0],
> 			      flags);
> }
>
>
> I CCd glibc so that they can comment.

POSIX uses these types for fexecve and execve, and it seemed right to be
consistent with that.

There are several more manual pages which do not specify the correct
prototype: open, openat, prctl.  I have received compiler bug reports
when people used function pointers modeled after the declarations of
open and prctl in the manual pages because of the ABI mismatch with the
glibc implementations.  The execveat difference is harmless in
comparison.

Thanks,
Florian

