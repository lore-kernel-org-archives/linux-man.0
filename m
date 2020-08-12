Return-Path: <SRS0=R2T6=BW=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56C3C433E0
	for <linux-man@archiver.kernel.org>; Wed, 12 Aug 2020 14:37:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B8C720756
	for <linux-man@archiver.kernel.org>; Wed, 12 Aug 2020 14:37:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgHLOhz (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 12 Aug 2020 10:37:55 -0400
Received: from mailbackend.panix.com ([166.84.1.89]:29528 "EHLO
        mailbackend.panix.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgHLOhz (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 12 Aug 2020 10:37:55 -0400
Received: from panix5.panix.com (panix5.panix.com [166.84.1.5])
        by mailbackend.panix.com (Postfix) with ESMTP id 4BRXNy1gZyz1ddB;
        Wed, 12 Aug 2020 10:37:54 -0400 (EDT)
Received: by panix5.panix.com (Postfix, from userid 415)
        id 4BRXNy4hYMzfYm; Wed, 12 Aug 2020 10:37:54 -0400 (EDT)
Date:   Wed, 12 Aug 2020 10:37:54 -0400
From:   Thor Lancelot Simon <tls@NetBSD.ORG>
To:     mtk.manpages@gmail.com
Cc:     Larry Dwyer <larryd.kbd@gmail.com>,
        Florian Weimer <fweimer@redhat.com>,
        linux-man <linux-man@vger.kernel.org>,
        Geoff Clare <gwc@opengroup.org>, austin-group-l@opengroup.org,
        Andrew Josey <ajosey@opengroup.org>,
        libc-alpha <libc-alpha@sourceware.org>,
        Elliot Hughes <enh@google.com>,
        Joseph Myers <joseph@codesourcery.com>
Subject: Re: Pseudoterminal terminology in POSIX
Message-ID: <20200812143754.GA27055@panix.com>
References: <CALxWeYrisuzEPVEHOQSFJ8G_=8-VTAOTNBquyszOZMid7YfT=Q@mail.gmail.com>
 <6425d636-7f48-3a73-ef0e-7bb5b991360c@gmail.com>
 <20200810135821.GA11918@panix.com>
 <3ace6e62-d3cc-ef7b-56b2-9b6b5c724d5b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ace6e62-d3cc-ef7b-56b2-9b6b5c724d5b@gmail.com>
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Tue, Aug 11, 2020 at 10:31:58AM +0200, Michael Kerrisk man-pages via austin-group-l at The Open Group wrote:
> On 8/10/20 3:58 PM, Thor Lancelot Simon wrote:
> > On Sat, Aug 08, 2020 at 04:18:10PM -0700, Larry Dwyer via austin-group-l at The Open Group wrote:
> >> How about the "control" side and the "terminal" side (of the paired device
> >> files)?
> > 
> > How about the "pty side" and the "tty side"?  It seems hard to be more
> > neutral than that and we can be sure there is no ambiguity.
> 
> This is an option that came up in the glibc/Linux man-pages discussion.
> My objection is that I want proper nouns that one can use in a prose
> description of pseudoterminals.

Perhaps "lead" and "follower"?  This terminology comes from multiple unit
control systems on railroad locomotives (where it's been used interchangably
with the problematic "master" / "slave" for a long time) and I think it's
fairly descriptive of the situation with the pty control and terminal
units, too.

