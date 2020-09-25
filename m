Return-Path: <SRS0=7aiR=DC=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75FAFC4363D
	for <linux-man@archiver.kernel.org>; Fri, 25 Sep 2020 17:43:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEF48238E2
	for <linux-man@archiver.kernel.org>; Fri, 25 Sep 2020 17:43:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HyU0RKhd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729354AbgIYRnA (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 25 Sep 2020 13:43:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42006 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728416AbgIYRnA (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 25 Sep 2020 13:43:00 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601055779;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7N6z94MGd0FX3J4+50G/PkhondYj8InFU0tt0RiuRwk=;
        b=HyU0RKhd1WckRYHEK+44A4JWA9bz9C2pUdhKcFKQLT8EpALdL1mUHrZLAB3MCf7AMM7d/b
        cAQgOGkIRwQjqLTio6qlwnRXQmiD/vigbCQMKmEJVru1tHRZ1YlHUXb/WgJOADZS/4uPBV
        aDd6GE46/Cb9oTc6XD4s4bZd8dSE5dk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-DYD928vjMa2JiSqYo-8Wbg-1; Fri, 25 Sep 2020 13:42:55 -0400
X-MC-Unique: DYD928vjMa2JiSqYo-8Wbg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E68E5425E6;
        Fri, 25 Sep 2020 17:42:53 +0000 (UTC)
Received: from localhost (unknown [10.33.36.4])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 61FB25D9DC;
        Fri, 25 Sep 2020 17:42:53 +0000 (UTC)
Date:   Fri, 25 Sep 2020 18:42:52 +0100
From:   Jonathan Wakely <jwakely@redhat.com>
To:     Alejandro Colomar <colomar.6.4.3@gmail.com>
Cc:     fweimer@redhat.com, linux-man@vger.kernel.org,
        libc-alpha@sourceware.org, gcc@gcc.gnu.org, rusty@rustcorp.com.au,
        linux-kernel@vger.kernel.org, libstdc++@gcc.gnu.org,
        libc-coord@lists.openwall.com, enh@google.com
Subject: Re: [PATCH v2] <sys/param.h>: Add nitems() and snitems() macros
Message-ID: <20200925174252.GO6061@redhat.com>
References: <20200922145844.31867-1-colomar.6.4.3@gmail.com>
 <20200925132000.235033-1-colomar.6.4.3@gmail.com>
 <f6257d7d-1cea-b45c-a858-b80bbc1f18b1@gmail.com>
 <20200925144822.GM6061@redhat.com>
 <22c110fe-4c92-e5e6-dc35-dbf00a97cfa2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <22c110fe-4c92-e5e6-dc35-dbf00a97cfa2@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 25/09/20 18:30 +0200, Alejandro Colomar via Libstdc++ wrote:
>I have a similar number of ARRAY_SIZE() and ARRAY_SSIZE().
>I could have '#define snitems(arr) ((ptrdiff_t)nitems(arr))' in my projects,
>but is it really necessary?

The barrier for adding something to glibc headers should be a LOT
higher than "I could [do it in my own code], but is it really
necessary?"

>Did I convince you? :-)

No.


