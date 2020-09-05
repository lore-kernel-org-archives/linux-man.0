Return-Path: <SRS0=Bu2X=CO=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445F5C433E2
	for <linux-man@archiver.kernel.org>; Sat,  5 Sep 2020 07:12:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2E0D206B8
	for <linux-man@archiver.kernel.org>; Sat,  5 Sep 2020 07:12:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgIEHMj (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 5 Sep 2020 03:12:39 -0400
Received: from albireo.enyo.de ([37.24.231.21]:41540 "EHLO albireo.enyo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725818AbgIEHMi (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Sat, 5 Sep 2020 03:12:38 -0400
Received: from [172.17.203.2] (helo=deneb.enyo.de)
        by albireo.enyo.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1kESNI-0006lL-5j; Sat, 05 Sep 2020 07:12:36 +0000
Received: from fw by deneb.enyo.de with local (Exim 4.92)
        (envelope-from <fw@deneb.enyo.de>)
        id 1kESNI-0002Sx-1N; Sat, 05 Sep 2020 09:12:36 +0200
From:   Florian Weimer <fw@deneb.enyo.de>
To:     Jonny Grant <jg@jguk.org>
Cc:     linux-man <linux-man@vger.kernel.org>,
        Michael Kerrisk <mtk.manpages@gmail.com>
Subject: Re: strlen
References: <0bf239e9-cfc7-8889-ca00-b1d1566bd174@jguk.org>
        <87lfhpgxf8.fsf@mid.deneb.enyo.de>
        <017a5a66-ba66-7cc8-c607-f851c2e54fc4@jguk.org>
Date:   Sat, 05 Sep 2020 09:12:36 +0200
In-Reply-To: <017a5a66-ba66-7cc8-c607-f851c2e54fc4@jguk.org> (Jonny Grant's
        message of "Sat, 5 Sep 2020 00:14:35 +0100")
Message-ID: <87363whf2z.fsf@mid.deneb.enyo.de>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

* Jonny Grant:

> On 04/09/2020 20:21, Florian Weimer wrote:
>> * Jonny Grant:
>> 
>>> Hello
>>>
>>> https://man7.org/linux/man-pages/man3/strlen.3.html
>>>
>>> Is it possible to clarify :-
>>>
>>> * glibc will SIGSEGV if 's' is NULL
>>> * there are no ERROR returns
>> 
>> That would be misleading.  Whether strlen (NULL) is undefined also
>> depends on the compiler.  They know that the argument cannot be zero
>> and optimize accordingly.
>> 
>
> Hi,
>
> Do you know a compiler that has a different behaviour? I only tested
> gcc and clang. How would a compiler optimise?

Here's an example:

#include <stddef.h>
#include <stdio.h>
#include <string.h>

void
f (const char *str)
{
  strlen (str);
  if (str == NULL)
    puts ("str is NULL");
}

int
main (void)
{
  f (NULL);
  return 0;
}

When built with -O2, GCC 8 prints nothing, and there is no crash.

My point it's not just the C *library* that makes strlen (NULL)
undefined.  It's undefined according to the language, and even if we
changed the glibc implementation, things would still go wrong.
