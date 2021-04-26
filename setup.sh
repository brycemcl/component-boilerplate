#!/bin/sh
set -e
mkdir -p $1
cd $1
mkdir $2
cd $2

cat > index.tsx <<EOF
import index from './$2';
export default index
EOF
cat > $2.tsx <<EOF
import styles from './$2.module.css'
const component = ({}) => {
  return (
    <>
      
    </>
  )
}

export default component
EOF
cat > $2.stories.tsx <<EOF
import $2 from '.'

export default {
  title: '$1/$2',
  component: $2,
}
const Template = (args) => <$2 {...args} />

export const standard = Template.bind({})
standard.args = {}
export {}
EOF

cat > $2.test.tsx <<EOF
import { render } from '@testing-library/react'
import * as $2 from './index.stories'

test('renders', () => {
  //render(<Standard {...Standard.args} />)
})
EOF

touch $2.module.css