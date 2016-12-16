From: "Serge E. Hallyn" <serge@hallyn.com>
Subject: Re: RFC: capabilities(7): notes for kernel developers
Date: Fri, 16 Dec 2016 15:05:39 -0600
Message-ID: <20161216210539.GA15589@mail.hallyn.com>
References: <cdbc35f2-925e-aa65-98e7-a4ae4a5ded2c@gmail.com>
 <edb66332-86c9-6122-85c5-f856309cbfc1@schaufler-ca.com>
 <43dcc6dc-265b-5eaf-3a70-701e05200b9f@gmail.com>
 <9ed6371f-3d38-45b1-a85b-1fbb3e5b4fc7@schaufler-ca.com>
 <CALAqxLWr8+GpGG+geibKQqPxGHtPQbzYjEptjA4r+jNcRrMWvw@mail.gmail.com>
 <7a6b5f38-de8e-d8d4-e6f7-feae3f8d192e@schaufler-ca.com>
 <e8a6d266-9870-2591-576b-927208683b5d@gmail.com>
 <20161216201026.GB14856@mail.hallyn.com>
 <CALAqxLXzpntE=-9AY3iHiZRj4uMAi_tsXRM=exhSvBeajt=z9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-security-module-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALAqxLXzpntE=-9AY3iHiZRj4uMAi_tsXRM=exhSvBeajt=z9Q@mail.gmail.com>
Sender: owner-linux-security-module@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Casey Schaufler <casey@schaufler-ca.com>, James Morris <jmorris@namei.org>, Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@amacapital.net>, Jann Horn <jann@thejh.net>, "Eric W. Biederman" <ebiederm@xmission.com>, linux-man <linux-man@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
List-Id: linux-man@vger.kernel.org

Quoting John Stultz (john.stultz@linaro.org):
> On Fri, Dec 16, 2016 at 12:10 PM, Serge E. Hallyn <serge@hallyn.com> wrote:
> > Quoting Michael Kerrisk (man-pages) (mtk.manpages@gmail.com):
> >> On 12/16/2016 01:44 AM, Casey Schaufler wrote:
> >> > On 12/15/2016 4:31 PM, John Stultz wrote:
> >> >> On Thu, Dec 15, 2016 at 12:40 PM, Casey Schaufler
> >> >> <casey@schaufler-ca.com> wrote:
> >> >>> On 12/15/2016 11:41 AM, Michael Kerrisk (man-pages) wrote:
> >> >>>> On 12/15/2016 05:29 PM, Casey Schaufler wrote:
> >> >>>>> CAP_WAKE_ALARM could readily be CAP_TIME.
> >> >>>> Actually, I don't quite understand what you mean with that sentence.
> >> >>>> Could you elaborate?
> >> >>> Should have said CAP_SYS_TIME
> >> >>>
> >> >>> Setting an alarm could be considered a time management function,
> >> >>> depending on what it actually does.
> >> >> Just a nit here. CAP_WAKE_ALARM is more about the privilege of waking
> >> >> a system from suspend, while CAP_SYS_TIME covers the ability to set
> >> >> the time. One wouldn't necessarily want to give applications which
> >> >> could wake a system up the capability to also set the time.
> >> >
> >> > Doesn't really matter, except that an ignorant developer
> >> > might make the mistake I did and assume that WAKE_ALARM
> >> > was somehow related to time management. If you want to use
> >> > it as an example don't let my dunderheadedness get in your
> >> > way.
> >>
> >> Actually, I decided it wasn't such a good example anyway.
> >> That capability could potentially be generic. (But it probably
> >> should better have been named something like 'CAP_WAKE_SYSTEM'.)
> >
> > How about:
> >
> > Subject: [PATCH 1/1] capabilities: alias CAP_WAKE_SYSTEM to CAP_WAKE_ALARM
> >
> > As suggested by Michael Kerrisk his is a less confusing name, and
> > this won't break any old userspace.
> >
> > Signed-off-by: Serge Hallyn <serge@hallyn.com>
> > Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> > ---
> >  include/uapi/linux/capability.h | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/include/uapi/linux/capability.h b/include/uapi/linux/capability.h
> > index fd4f87d..ba972ff 100644
> > --- a/include/uapi/linux/capability.h
> > +++ b/include/uapi/linux/capability.h
> > @@ -357,6 +357,8 @@ struct vfs_ns_cap_data {
> >
> >  #define CAP_WAKE_ALARM            35
> >
> > +#define CAP_WAKE_SYSTEM      CAP_WAKE_ALARM
> > +
> 
> I was thinking of the same thing. Although I might rename the
> numerical define to WAKE_SYSTEM and put WAKE_ALARM as the alias (along
> with a comment as to WAKE_ALARM being deprecated), so its more clear
> which is the one that ought to be used by new code.
> 
> However, in the spirit of this thread, we might even consider
> broadening the cap silo a bit further, to something like
> CAP_WAKE_SUSPEND, such that it might also be able to cover broader PM
> actions?

Or just CAP_UNSUSPEND?
